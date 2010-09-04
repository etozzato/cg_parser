# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def h_date(date)
    date.respond_to?(:strftime) ? date.strftime("%b #{date.day.ordinalize}") : ''
  end
  
  def page_title
    "MyStream&trade; - #{CONFIG[:make]||CONFIG[:reg_exp].titleize} for sale in the USA"
  end
  
end
