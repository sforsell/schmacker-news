class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      t.string :text, null: false
    end
  end
end
