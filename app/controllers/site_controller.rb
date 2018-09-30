class SiteController < ApplicationController
	layout 'site'

	def index
		@photos= Photo.order("created_at desc").limit(25)
	end

	def userprofile
		@user=User.find_by_id(params[:id])
		unless @user
			logger.warn "User with id #{params[:id]} does not exists"
		end
		@albums = @user.albums.paginate(:page => params[:page], :per_page => 10)
	end


end
