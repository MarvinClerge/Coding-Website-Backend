class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :image
      t.string :email
      t.string :level
      t.string :experience

      t.timestamps
    end
  end
end
