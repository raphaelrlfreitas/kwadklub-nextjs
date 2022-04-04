class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def generate_jwt
    JWT.encode({user_id: id, exp: 365.days.from_now.to_i}, 'b2401c6b39a98dc6735c1d394b211a4892902883c46f996d2b255e09bff6a3346e3f3f60e702b7eb04c31f190f4d3057fd4ffce92f8ffcaf59ee8504d04642a6')
  end
end
