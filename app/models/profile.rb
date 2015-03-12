class Profile < ActiveRecord::Base
	paperclip_opts = {
      	:styles => { :small => "300x300#"}
    }
      if Rails.env.development?
      	paperclip_opts.merge! :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    						  :url => "/system/:attachment/:id/:style/:filename"
      else
      	paperclip_opts.merge! :storage => :s3,
      						  :bucket  => ENV['S3_BUCKET_NAME']
      end


	belongs_to :user
	has_many :countries
	has_many :cities, through: :countries
	has_attached_file :photo, paperclip_opts
	validates :photo, presence: true, :attachment_content_type => { :content_type => ['image/png', 'image/jpg', 'image/jpeg']}
	validates :name, presence: true

end
