ActionController::Routing::Routes.draw do |map|

  map.resources :posts, :collection => {:search => :post}
  map.root :controller => 'posts'

end
