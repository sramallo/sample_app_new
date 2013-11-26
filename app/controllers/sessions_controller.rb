class SessionsController < ApplicationController
  def new
  end

  def create
# This is with form_for
#    user = User.find_by(email: params[:session][:email].downcase)
# And this is with form_tag, without :session in params hash
    user = User.find_by(email: params[:email].downcase)
#    if user && user.authenticate(params[:session][:password])
    if user && user.authenticate(params[:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end

