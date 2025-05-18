class Post < ApplicationRecord
  belongs_to :author
  validates :title, presence: true
  validates :body, presence: true
  validates :published_at, presence: true
end
