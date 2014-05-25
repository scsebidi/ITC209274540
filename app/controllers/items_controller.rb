class ItemsController < InheritedResources::Base
	def index

		@cart= session[:items] || {}
	end
	def add
		id=params[:id] || {}
		cart = session[:items] || {}
		cart[id] = (cart[id] || 0) + 1

		redirect_to :action => :index

	end

end
/