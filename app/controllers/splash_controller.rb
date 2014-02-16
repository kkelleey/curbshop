class SplashController < ApplicationController

#R.A. Looks good

	def index
  	redirect_to user_root_path if user_signed_in?
  end
end
