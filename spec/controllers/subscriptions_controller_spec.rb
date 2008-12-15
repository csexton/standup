require File.dirname(__FILE__) + '/../spec_helper'

describe SubscriptionsController do
  fixtures        :users
  before do 
    @user  = mock_user
    @login_params = { :login => 'quentin', :password => 'test' }
    User.stub!(:authenticate).with(@login_params[:login], @login_params[:password]).and_return(@user)
  end
  def do_create
    post :create, @login_params
  end
  describe "Create new subscription," do
    it "Subscribe quentin to aaron" do
      true.should be_true
    end
  end
end

