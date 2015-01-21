class Profile < ActiveRecord::Base
	belongs_to :user
	has_attached_file :photo, :styles => { :small => "300x300"}
end
