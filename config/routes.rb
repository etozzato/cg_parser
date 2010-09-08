ActionController::Routing::Routes.draw do |map|

  map.resources :posts, :collection => {:search => :get}
  map.root :controller => 'posts'

end
