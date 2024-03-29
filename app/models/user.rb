class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable,
         :lockable, :timeoutable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :posts,
    foreign_key: 'author_id'
end
