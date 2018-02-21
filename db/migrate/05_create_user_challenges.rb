class CreateUserChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :user_challenges do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :challenge, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
