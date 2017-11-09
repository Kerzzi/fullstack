class Course < ApplicationRecord
  validates :title, presence: true
  
  has_many :post_relationships
  has_many :course_posts, :through => :post_relationships, :source => :post
  has_one :syllabus, :dependent => :destroy
  has_many :assignments, :dependent => :destroy
  has_many :faqs, :dependent => :destroy
  has_many :activities, :dependent => :destroy
end
