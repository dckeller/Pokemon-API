class User < ApplicationRecord
  has_many :subscriptions
  has_many :reviews

  validates :name, :email, :password, { :presence => true }

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def password
    @password ||= Password.new(hashed_password)
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user if user && user.password == password
    # if user
    #   return user if user.password == password
    #   return nil
    # else
    #   return nil
    # end
  end

end
