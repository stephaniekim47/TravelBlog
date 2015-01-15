class Country < ActiveRecord::Base
      has_attached_file :photo, :styles => { :small => "100x100#", :medium => "1000x600#" }

      validates :photo, presence: true, :attachment_content_type => { :content_type => ['image/png', 'image/jpg', 'image/jpeg']}
      validates :title, presence: true, uniqueness: true

      def title=(s)
      	super s.titleize
      end
end
