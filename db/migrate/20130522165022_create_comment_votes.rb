class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.integer :user_id, :comment_id, :vote 
    end 
  end
end
