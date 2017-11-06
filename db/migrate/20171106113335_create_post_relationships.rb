class CreatePostRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :post_relationships do |t|
      t.integer :course_id
      t.integer :post_id

      t.timestamps
    end
  end
end
