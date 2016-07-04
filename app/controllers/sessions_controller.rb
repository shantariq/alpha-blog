class SessionsController < ApplicationController

	def new

	end

	def create

		user = User.find_by(email: params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success]= "you are successfully login"
			redirect_to user_path(user)


		else
			flash.now[:danger] = "There was some thing wrong with your login inforamtion"
             render 'new'
             # ye message aise ku k k model based nai 
		end

	end

	def destroy
		session[:user_id] = nil
		session[:success] = "You have logout"
		redirect_to root_path

	end
end