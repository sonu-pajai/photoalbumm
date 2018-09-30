module SiteHelper

	def get_photos(album)
		album.photos.order("created_at desc")
	end
end
