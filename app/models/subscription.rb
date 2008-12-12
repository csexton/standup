class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :sub, :class_name => "User", :foreign_key => "user_id"
end
