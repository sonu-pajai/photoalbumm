class Photo < ActiveRecord::Base

  extend FriendlyId
  	mount_uploader :image, ImageUploader
    friendly_id :tagline, use: :slugged

    belongs_to :album
    belongs_to :user
    validates :tagline, :image, presence: true
    validate :max_count_images

    private 
    def max_count_images
    	if album.photos.length == 25
      		errors.add(:image, "Max 25 images allowed in a album") 
    	end
    end
end
