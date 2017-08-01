class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false
      t.string :body, null: false
    end

  end
end
