require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  fixtures :posts, :users

  before(:each) do
    @valid_attributes = {
      :body => "Valid post body",
      :user_id => users(:quentin)
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(@valid_attributes)
  end
  it "should have a non-empty collection of posts" do
    Post.find(:all).should_not be_empty
  end

  it "should belong to a user" do
    post = Post.find(posts(:one).id)
    post.user.should eql(users(:quentin))
  end

  it "should not allow a body of more than 255 chars" do
    post = Post.new
    post.body = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    post.should_not be_valid
  end

  #it "should not be valid with out a body" do
  #  post = Post.new
  #  post.body = "Body"
  #  #post.should_be_valid
  #end
end
