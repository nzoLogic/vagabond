class User < ApplicationRecord
  has_many :posts

  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
  extend FriendlyId
  friendly_id :first_name, use: :slugged
end
