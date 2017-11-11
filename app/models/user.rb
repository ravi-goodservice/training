class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.create_with_omniauth(auth)   #creating user from facebook auth login

    user = find_or_create_by(uid: auth['uid'], provider:  auth['provider'])
    puts user
    puts auth.to_json
    user.email = "#{auth['uid']}@#{auth['provider']}.com"
    user.password = auth['uid']
    if user
      user
    else
      user.save!
      user
    end
  end
end
