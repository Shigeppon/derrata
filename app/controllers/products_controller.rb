class ProductsController < BaseController
  before_filter :load_product, :only => %w(show stock_table)
  before_filter :load_recommend_products, :only => %w(show)
  before_filter :load_recommend_ranking_products, :only => %w(show index)
  
  def show
    load_seo_products_detail
    @recommend_buys = Recommend.recommend_get(@product.id, Recommend::TYPE_BUY) || []
    @recommend_views = Recommend.recommend_get(@product.id, Recommend::TYPE_VIEW) || []
    if request.mobile?
      ProductAccessLog.create(:product_id => @product.id,
                              :session_id => session.session_id,
                              :customer_id => @login_customer && @login_customer.id,
                              :docomo_flg => request.mobile == Jpmobile::Mobile::Docomo, 
                              :ident => request.mobile.ident)
    end
  end

  def search
    index

    render :action => :index
  end

  def index
    load_seo_products_list
    conditions = Product.default_condition

    unless params[:search].blank?
      params[:search].split(" ").each do |search_str|
       conditions << [ "(products.name || products.key_word || products.introduction) like  ?", "%#{search_str}%"]
      end
    end

    if (! params[:category_id].blank?  ) && params[:category_id] =~ /^[0-9]*$/ && params[:category_id].to_i < 2147483647
      @category = Category.find(:first, :conditions => ["id = ?", params[:category_id] ] )
      if @category
        ids = @category.get_child_category_ids
        conditions << ["category_id IN (#{ids.join(",")})" ]
        @category_name = @category.name
      end
    end

    if (! params[:retailer_id].blank?  ) && params[:retailer_id] =~ /^[0-9]*$/ && params[:retailer_id].to_i < 2147483647
      @retailer = Retailer.find(:first, :conditions => ["id = ?", params[:retailer_id] ] )
      if @retailer
        conditions << ["retailer_id = ? ", @retailer.id]
      end
    end
    
    order = params[:order] == "price" ? "product_price.max_price desc" : "products.updated_at desc"
    per_page = request.mobile? ? 10 : 16
    @products = Product.paginate(:page => params[:page], :per_page => per_page, :conditions => flatten_conditions( conditions ),
                                 :joins => "left join (select product_styles.product_id,max(sell_price) as max_price from product_styles group by product_id) as product_price on product_price.product_id = products.id ",
                             :include => Product::DEFAULT_INCLUDE,
                             :order => order)
  end

  def show_image
    unless params[:id].blank?
      @product = Product.find(:first, :conditions => ["products.id = ? and permit = ? and ? >= products.sale_start_at",  params[:id], true, Date.today],
                              :include => Product::DEFAULT_INCLUDE)
    end
    render :layout => false
  end

  def stock_table
    @product_styles = @product.product_styles
    @have_style = @product_styles.any?(&:style_category1)
    if @have_style
      @have_style2 = @have_style && @product_styles.any?(&:style_category2)
      @style_name1 = @product_styles.first.style_name1
      @style_name2 = @product_styles.first.style_name2
    end
    if params[:partial]
      render :layout => false
    end
  end

  private
  def load_product
    unless params[:id].blank?
      @product = Product.find(:first, :conditions => ["products.id = ? and permit = ? and ? >= products.public_start_at",  params[:id], true, Date.today],
                              :include => Product::DEFAULT_INCLUDE)
    end
    if @product
      unless @product.in_public_term?
        redirect_to :action => "index"
        return
      end
      @product_name = @product.name
      @category_name = @product.category.name if @product.category
    else
      raise ActiveRecord::RecordNotFound
    end
    true
  end

  def load_recommend_products
    @recommend_products = RecommendProduct.find(:all, :order => "position")
 end

  def load_seo_products_list
    @seo= Seo.find(:first, :conditions=>{ :page_type => Seo::PRODUCTS_LIST})
  end

  def load_seo_products_detail
    @seo = Seo.find(:first, :conditions=>{ :page_type => Seo::PRODUCTS_DETAIL})
  end
  
  def load_recommend_ranking_products
    @recommend_xmls = Recommend.ranking_get(4)    
  end

end
