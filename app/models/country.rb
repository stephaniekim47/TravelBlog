class Country < ActiveRecord::Base
      has_many :cities, dependent: :destroy
      belongs_to :user

      has_attached_file :photo, :styles => { :small => "300x300#", :medium => "1000x600#" }, :storage => :s3,
            :bucket  => ENV['travel123']


      validates :photo, presence: true, :attachment_content_type => { :content_type => ['image/png', 'image/jpg', 'image/jpeg']}
      validates :title, presence: true, uniqueness: true

      def title=(s)
      	super s.titleize
      end
end
