class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body
  validates_size_of :body, :within => 0..255 

  # Define the per_page method for will_paginate
  cattr_reader :per_page
  @@per_page = 20
end
