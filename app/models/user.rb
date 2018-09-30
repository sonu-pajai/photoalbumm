class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
	has_many :albums
	has_many :photos
	before_create :set_name

	private
	
	def set_name
		self.name = email.split("@").first
	end

end
