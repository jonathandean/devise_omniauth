class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # TODO only have omniauthable and required here and give instructions for adding the rest in your app
  devise :database_authenticatable, :registerable, :token_authenticatable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :omniauth_authentications, :class_name => DeviseOmniauth::Authentication

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
