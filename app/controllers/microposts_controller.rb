class MicropostsController < ApplicationController
  before_action :signed_in_user
  before_action :signed_in_user, only: [:create, :destroy]

  def home
    @micropost = current_user.microposts.build if signed_in?
  end

  def index
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def new
    super
  end

  def destroy
  end

 private

 def micropost_params
   params.require(:micropost).permit(:content)
 end
end
