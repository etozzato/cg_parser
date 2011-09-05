ActionController::Routing::Routes.draw do |map|

  map.resources :posts, :collection => {:search => :get}
  map.root :controller => 'posts'
  
  map.distribution '/distribution', :controller => 'maps'
  #map.location '/location',   :controller => 'maps', :action => 'set'
  
  
end
