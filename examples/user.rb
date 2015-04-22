class User < ActiveRecord::Base
  validates_uniqueness_of :uid
  validates_presence_of :email
end
