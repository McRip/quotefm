require 'rubygems'
require 'httparty'

require "quotefm/version"
require "quotefm/recommendation"
require "quotefm/article"
require "quotefm/page"
require "quotefm/user"
require "quotefm/category"

module Quotefm
  # Your code goes here...
end

class Object
  # Alias of <tt>to_s</tt>.
  def to_param
    to_s
  end
end

class NilClass
  def to_param
    self
  end
end

class TrueClass
  def to_param
    self
  end
end

class FalseClass
  def to_param
    self
  end
end

class Array
  # Calls <tt>to_param</tt> on all its elements and joins the result with
  # slashes. This is used by <tt>url_for</tt> in Action Pack.
  def to_param
    collect { |e| e.to_param }.join '/'
  end
end

class Hash
  # Returns a string representation of the receiver suitable for use as a URL
  # query string:
  #
  #   {:name => 'David', :nationality => 'Danish'}.to_param
  #   # => "name=David&nationality=Danish"
  #
  # An optional namespace can be passed to enclose the param names:
  #
  #   {:name => 'David', :nationality => 'Danish'}.to_param('user')
  #   # => "user[name]=David&user[nationality]=Danish"
  #
  # The string pairs "key=value" that conform the query string
  # are sorted lexicographically in ascending order.
  #
  # This method is also aliased as +to_query+.
  def to_param(namespace = nil)
    collect do |key, value|
      value.to_query(namespace ? "#{namespace}[#{key}]" : key)
    end.sort * '&'
  end
end

class Object
  # Converts an object into a string suitable for use as a URL query string, using the given <tt>key</tt> as the
  # param name.
  #
  # Note: This method is defined as a default implementation for all Objects for Hash#to_query to work.
  def to_query(key)
    require 'cgi' unless defined?(CGI) && defined?(CGI::escape)
    "#{CGI.escape(key.to_s)}=#{CGI.escape(to_param.to_s)}"
  end
end

class Array
  # Converts an array into a string suitable for use as a URL query string,
  # using the given +key+ as the param name.
  #
  #   ['Rails', 'coding'].to_query('hobbies') # => "hobbies%5B%5D=Rails&hobbies%5B%5D=coding"
  def to_query(key)
    prefix = "#{key}[]"
    collect { |value| value.to_query(prefix) }.join '&'
  end
end

class Hash
  alias_method :to_query, :to_param
end
