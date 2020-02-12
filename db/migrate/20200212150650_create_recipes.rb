class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :ingredients
      t.text :preparation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
