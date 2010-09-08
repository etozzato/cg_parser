class String
  def clean(sub='')
    return self.gsub(/\W/,sub)
  end
  
  def title
    return self[0].upcase + self[1..-1].downcase
  end
end