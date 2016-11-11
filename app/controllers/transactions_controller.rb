class TransactionsController < ApplicationController

	def create
		# puts params[:seller], params[:product]
		Transaction.create(
			buyer: User.find(session[:user_id]),
			seller:User.find(params[:seller]),
			product: Product.find(params[:product]))
		redirect_to :back
	end
end
