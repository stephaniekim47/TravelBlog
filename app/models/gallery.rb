class Gallery < ActiveRecord::Base
	belongs_to :city, :dependent => :destroy
	#belongs_to :user, through: :city
	has_many :gallery_photos
end
