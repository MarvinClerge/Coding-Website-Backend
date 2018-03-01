class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.integer :level
      t.integer :experience
      t.string :language
      t.string :category
      t.string :title
      t.string :content
      t.string :description
      t.string :test_value
      t.string :test_expected
      t.string :test_description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
