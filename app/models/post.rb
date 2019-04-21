class Post < ApplicationRecord
	mount_uploader :image, MediaFileUploader
	
	belongs_to :user
	belongs_to :category
	has_many :votes
  has_many :comments
	def self.search(search)
		if search
			where(['name LIKE ?', "%#{search}%"])
		else
			all
		end
	end
end