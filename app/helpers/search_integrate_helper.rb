module SearchIntegrateHelper

  def search_integrate(param_name='q')
    unless params[param_name.to_sym].blank?
      concat(stylesheet_link_tag 'searchintegrate')
      concat(%(<div id='search_integrate' style='display:none;'></div>))
    end 
    yield
    unless params[param_name.to_sym].blank?
      concat(javascript_include_tag(wp_server + "/search.js?q=#{params[param_name.to_sym]}&limit=3"))
      concat(javascript_tag("if (typeof(search_integrate_content) != 'undefined'){
      $('search_integrate').update(search_integrate_content);  $('search_integrate').appear()}"))
    end
  end
  
  def wp_server
    Rails.env.development? ? 'http://localhost:3030' : 'http://wp.searchintegrate.com'
  end
  
end