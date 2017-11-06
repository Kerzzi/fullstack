class Post < ApplicationRecord
  validates :title, presence: true
  
  has_many :post_relationships
  has_many :post_courses, through: :post_relationships, source: :course
end
