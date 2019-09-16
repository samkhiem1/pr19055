class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :micropost, index: true, foreign_key: true 
      t.references :users, index: true, foreign_key: true
      t.timestamps 
    end
  end
end
