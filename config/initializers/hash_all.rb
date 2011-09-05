require 'will_paginate'
class ActiveRecord::Base

  def self.hash_all(hash_key, *args)
    hash = {}
    ar_column = args[0].delete(:ar_column) unless args.nil? || args[0].nil?
    collection = find(:all, *args)
    unless collection.empty?
      if ar_column
        collection.each_with_index {|el, idx| hash[el.send(hash_key) || idx] = el.send(ar_column)}
      else
        collection.each_with_index {|el, idx| hash[el.send(hash_key) || idx] = el}
      end
    end
    hash
  end

end