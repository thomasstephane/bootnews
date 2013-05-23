class PostVote < ActiveRecord::Base
    validates :user_id, :post_id, :vote, presence: true

    belongs_to :user 
    belongs_to :post
end
