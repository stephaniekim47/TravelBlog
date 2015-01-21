class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :user

  has_attached_file :photo, :styles => { :small => "100x100#", :medium => "500x500#" }
  validates :photo, presence: true, :attachment_content_type => { :content_type => ['image/png', 'image/jpg', 'image/jpeg']}

end
