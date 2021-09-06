class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :text
      t.references :user,  null: false, foreign_kye: true 
      t.timestamps
    end
  end
end
