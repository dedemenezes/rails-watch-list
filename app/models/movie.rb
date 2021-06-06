class Movie < ApplicationRecord

  has_many :bookmarks
  has_many :reviews

  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_overview,
  against: [ :title, :overview ],
  using: {
    tsearch: { prefix: true } # <-- now `god` will return something!
  }
  
end
