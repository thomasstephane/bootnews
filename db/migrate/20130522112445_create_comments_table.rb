class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table  :comments do |t|
      t.text      :comment
      t.integer   :post_id, :user_id 

      t.timestamps
    end
  end
end
