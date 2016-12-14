class UsersController < ApplicationController

	def create
		user = User.create(user_params)
		if user.errors.full_messages.length !=0 
			flash[:errors] = user.errors.full_messages 
			redirect_to :back
		else 
			session[:user_id] = user.id
			redirect_to user_path(session[:user_id])
		end
	end

	def show
		if session[:user_id]
			@user = User.find(params[:id])
			if Transaction.pluck(:product_id) == []
					@userProducts = @user.products.all
			else
				@userProducts = @user.products.where('id not in (?)',Transaction.pluck(:product_id))
			end
			@sales = @user.sales
			@purchases = @user.purchases
			render 'dashboard'
		else 
			redirect_to "/"
		end
	end


	private

	def user_params
    params.require(:user).permit(:name,:email, :password)
	end
end
