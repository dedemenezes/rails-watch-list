class List < ApplicationRecord

  has_many :bookmarks, dependent: :delete_all
  has_many :movies, through: :bookmarks, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
end
