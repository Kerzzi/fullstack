class CreateSyllabuses < ActiveRecord::Migration[5.0]
  def change
    create_table :syllabuses do |t|
      t.text :content
      t.integer :course_id

      t.timestamps
    end
  end
end
