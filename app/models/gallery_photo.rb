class GalleryPhoto < ActiveRecord::Base
   belongs_to :gallery 
   paperclip_opts = {
      	:styles => { :small => "300x300#", :medium => "1000x600#" }
      }
      if Rails.env.development?
      	paperclip_opts.merge! :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    						  :url => "/system/:attachment/:id/:style/:filename"
      else
      	paperclip_opts.merge! :storage => :s3,
      						  :bucket  => ENV['S3_BUCKET_NAME']
      end 

  has_attached_file :photo, paperclip_opts
  validates :photo, presence: true, :attachment_content_type => { :content_type => ['image/png', 'image/jpg', 'image/jpeg']}
end