class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :posts
  has_many :votes
  has_many :identities
  has_many :comments
  mount_uploader :image , MediaFileUploader
    
  def self.find_for_oauth(auth, signed_in_resource = nil)
  	# identity = Identity.find_for_oauth(auth)
  	identity = Identity.find_or_create_by(uid: auth.uid, provider: auth.provider)

  	user = identity.user


  	if user.nil?
  		email = auth.info.email
  		user = User.where(email: email).last

  		if user.nil?
  			user = User.new({
  				full_name: auth.info.name,
  				email: email,
  				password: Devise.friendly_token[0,20]
  			})

  			user.save
  		end
  	end


  	if identity.user != user
  		identity.user = user
  		identity.save
  	end

  	user
  end

end
