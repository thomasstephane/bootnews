class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer :user_id, :post_id, :vote 
    end 
  end
end
