class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :content
      t.string :test
      t.string :language
      t.string :description
      t.integer :level
      t.string :category
      t.integer :experience

      t.timestamps
    end
  end
end
