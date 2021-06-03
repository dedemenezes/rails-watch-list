class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :delete_all
  has_many :lists, dependent: :delete_all
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
end
