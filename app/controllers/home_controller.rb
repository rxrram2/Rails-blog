class HomeController < ApplicationController
  def index
       @posts = Post.all
  end
  def admin_user_params
    params.require(:admin_user).permit(:name)
  end
end
