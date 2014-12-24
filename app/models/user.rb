class User < ActiveRecord::Base
  validates :idm, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
