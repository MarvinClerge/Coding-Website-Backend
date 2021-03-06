class CreateCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :codes do |t|
      t.string :content
      t.string :language
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
