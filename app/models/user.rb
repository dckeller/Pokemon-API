class User < ApplicationRecord
  has_many :subscriptions
  has_many :reviews

  validates :name, :email, :password, { :presence => true }
end
