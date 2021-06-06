class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :delete_all
  has_many :lists, dependent: :destroy

  has_one_attached :profile_photo
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 

  def display_photo
    if profile_photo.attached?
      profile_photo.key
    else
      "https://res.cloudinary.com/seguraocode/image/upload/v1623005675/wv4pas1xsurz884a6xi9.webp"
    end
  end
end
