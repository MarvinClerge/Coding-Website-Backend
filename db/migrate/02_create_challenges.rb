class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :description
      t.string :test_value
      t.string :test_value_type
      t.string :test_expected
      t.string :test_expected_type
      t.string :test_description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
