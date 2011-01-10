require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::HomeController do
  fixtures :admin_users, :customers, :order_deliveries
  before(:each) do
    session[:admin_user] = admin_users(:load_by_admin_user_test_id_1)
  end

  #Delete these examples and add some real ones
  it "should use Admin::HomeController" do
    controller.should be_an_instance_of(Admin::HomeController)
  end


  describe "GET 'index'" do
    it "ログイン時" do
      get 'index'
      response.should be_success
    end

    it 'ログアウト時' do
      session[:admin_user] = nil
      get 'index'
      response.should redirect_to(:controller=>"admin/accounts", :action=>:login)
    end
  end
end
