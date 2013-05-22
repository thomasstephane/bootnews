class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   :title, :url
      t.text     :post
      t.integer  :user_id

      t.timestamps
    end
  end
end
