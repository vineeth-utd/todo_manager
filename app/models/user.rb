class User < ActiveRecord::Base
  def to_pleasant_string
    "#{name} #{email} #{password}"
  end
end
