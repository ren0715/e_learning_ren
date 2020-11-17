class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :user, foreign_key: true
      t.integer :category_id
      t.integer :result

      t.timestamps
    end
  end
end
