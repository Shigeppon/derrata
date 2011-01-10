require File.dirname(__FILE__) + '/../spec_helper'

class DummyController < BaseController
  skip_before_filter :start_transaction
  skip_after_filter :end_transaction

  def exception_to_activerecord_recordnotfound
    rescue_action_in_public ActiveRecord::RecordNotFound.new
  end

  def exception_to_nameerror
    rescue_action_in_public NameError.new
  end
end

describe BaseController do
  fixtures :carts, :customers

  before do
    @controller.class.skip_before_filter :start_transaction
    @controller.class.skip_after_filter :end_transaction
  end

  #Delete this example and add some real ones
  it "should use BaseController" do
    controller.should be_an_instance_of(BaseController)
  end

  describe "cart_total_prices" do
    it "" do
      carts = customers(:have_cart_user).carts
      result = controller.cart_total_prices carts
      result.should > 0
    end
  end

  describe "rescue_action_in_public" do
    before do
      @controller = DummyController.new
    end
    it "exception is Active::RecordNotFound should render 404" do
      get 'exception_to_activerecord_recordnotfound'
      response.should render_template("public/404.html")
    end
    it "exception is NameError should render 500" do
      get 'exception_to_nameerror'
      response.should render_template("public/500.html")
    end
    it "exception is Active::RecordNotFound should render 404(mobile)" do
      request.user_agent = "DoCoMo/2.0 SH903i(c100;TB;W24H16)"
      get 'exception_to_activerecord_recordnotfound'
      response.should render_template("public/404_mobile.html")
    end
    it "exception is NameError should render 500(mobile)" do
      request.user_agent = "DoCoMo/2.0 SH903i(c100;TB;W24H16)"
      get 'exception_to_nameerror'
      response.should render_template("public/500_mobile.html")
    end
  end
end
