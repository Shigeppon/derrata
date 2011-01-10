class DeliveryTrader < ActiveRecord::Base

  acts_as_paranoid
  acts_as_list :scope => :retailer_id
  
  has_many :delivery_times,:order=>"position", :dependent => :destroy
  has_many :delivery_fees, :dependent => :destroy, :order => :prefecture_id
  has_many :payments
  has_many :orders
  belongs_to :retailer
  
  validates_presence_of :name
  validates_presence_of :retailer
  
  validates_length_of :name,:url, :maximum => 50
  
  validates_format_of :url, :with=>%r{^(https?://.*|)$}, :message=>"が不正です"
  
  validates_uniqueness_of :name, :scope => :retailer_id, :message => "に重複した名前は登録できません。" 

  # def validate_on_update
  #   n = DeliveryTrader.find_by_name(name)
  #   if n && n.id!=self.id
  #     errors.add :name,"に重複した名前は登録できません。"  
  #   end
  # end
  
  # def validate_on_create
  #   n = DeliveryTrader.find_by_name(name)
  #   if n 
  #     errors.add :name,"に重複した名前は登録できません。"  
  #   end
  # end
end
