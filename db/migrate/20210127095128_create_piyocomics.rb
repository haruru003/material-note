class CreatePiyocomics < ActiveRecord::Migration[6.0]
  def change
    create_table :piyocomics do |t|
      t.string :title
      t.text :introduction
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
