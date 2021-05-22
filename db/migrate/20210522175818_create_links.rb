class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.references :bookmark, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end
