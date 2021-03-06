class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :channel
      t.belongs_to :user, foreign_key: true
      t.belongs_to :challenge, foreign_key: true

      t.timestamps
    end
  end
end
