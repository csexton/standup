# Methods added to this helper will be available to all templates in the application.
require 'digest/md5'

module ApplicationHelper
  # plain old gravatar url  <%= gravatar_url_for 'greenisus@gmail.com' %>    
  # gravatar url with a rating threshold   <%= gravatar_url_for 'greenisus@gmail.com', { :rating => 'R' } %>    
  # show the avatar   <%= image_tag(gravatar_url_for 'greenisus@gmail.com')%>   
  # show the avatar with size specified, in case it's served slowly  <%= image_tag(gravatar_url_for('greenisus@gmail.com'), { :width => 80, :height => 80 }) %>    
  # link the avatar to some/url  <%= link_to(image_tag(gravatar_url_for 'greenisus@gmail.com'), 'some/url')%> 
  def gravatar_url_for(email, options = {})
    url_for({ :gravatar_id => Digest::MD5.hexdigest(email), :host => 'www.gravatar.com',
            :protocol => 'http://', :only_path => false, :controller => 'avatar.php'
    }.merge(options))  
  end
end
