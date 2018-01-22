class Organization < ActiveRecord::Base
  has_many :admins
  has_many :users
end
