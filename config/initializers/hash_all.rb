require 'will_paginate'
class ActiveRecord::Base

  def self.hash_all(hash_key, *opts)
    hash = {}
    collection = find(:all, *opts)
    unless collection.empty?
      collection.each_with_index {|el, idx| hash[el.send(hash_key) || idx] = el}
    end
    hash
  end

end