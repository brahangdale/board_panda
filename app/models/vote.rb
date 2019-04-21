class Vote < ApplicationRecord
	
	validates :user_id, :post_id, :vote_type, presence: true

	belongs_to :user
	belongs_to :post
end
