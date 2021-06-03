class Review < ApplicationRecord
  belongs_to :list
  belongs_to :user
  belongs_to :movie

  validates :comment, presence: true
  validates :rating, presence: true
end
