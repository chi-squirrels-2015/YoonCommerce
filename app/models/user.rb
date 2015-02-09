class User < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.forgot_password(userobject)
    @user = userobject
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @user.password = random_password
    @user.save!
    # Mailer.create_and_deliver_password_change(@user, random_password)
  end
end
