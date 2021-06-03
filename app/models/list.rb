class List < ApplicationRecord

  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  has_one_attached :photo
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end
