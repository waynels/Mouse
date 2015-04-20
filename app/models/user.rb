#encoding: utf-8
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :authentication_keys => [:username]
  validates_uniqueness_of :username
  validates_presence_of :username

end
