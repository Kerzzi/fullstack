class Faq < ApplicationRecord
  belongs_to :course
  
  validates :content, presence: true
end
