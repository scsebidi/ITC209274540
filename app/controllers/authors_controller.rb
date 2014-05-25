class AuthorsController < ApplicationController
	def show
		@authors= Author.all
	end

end
