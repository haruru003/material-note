class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.text :introduction
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
