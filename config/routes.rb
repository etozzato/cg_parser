ActionController::Routing::Routes.draw do |map|

  map.resources :posts, :collection => {:search => :get}
  map.root :controller => 'posts'
  
  map.usmap '/cars-map-usa', :controller => 'maps'
  
end
