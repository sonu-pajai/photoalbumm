class Album < ActiveRecord::Base
extend FriendlyId
    friendly_id :name, use: :slugged
    has_many :photos
    belongs_to :user
  	validates :name, presence: true
end
