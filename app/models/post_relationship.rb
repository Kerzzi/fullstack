class PostRelationship < ApplicationRecord
  belongs_to :post
  belongs_to :course
end
