class Post < ActiveRecord::Base
  belongs_to :user

  # Define the per_page method for will_paginate
  cattr_reader :per_page
  @@per_page = 20
end
