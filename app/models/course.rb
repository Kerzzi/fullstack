class Course < ApplicationRecord
  validates :title, presence: true
  
  has_many :post_relationships
  has_many :course_posts, :through => :post_relationships, :source => :post
end
