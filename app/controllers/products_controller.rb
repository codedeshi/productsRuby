class ProductsController < ApplicationController

	def index
		if session[:user_id]
			@user = User.find(session[:user_id])
			if Transaction.pluck(:product_id) == []
					@products = Product.all
			else
				@products = Product.where('id not in (?)',Transaction.pluck(:product_id))
			end
		end
	end

	def create
		p = product_params
		p['user'] = User.find(session[:user_id])
		product = Product.create(p)
		redirect_to :back
	end

	def destroy
		Product.delete(params[:id])
		redirect_to :back
	end


	def product_params
    params.require(:product).permit(:name, :amount)
	end

end
