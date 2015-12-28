class PostsController < ApplicationController
    def index
       @q = Post.search(params[:q])
       @posts = @q.result(distinct: true)
    end

    def show
       @post = Post.find(params[:id])
       @user = AdminUser.all   
       @post_comment = PostComment.new(:post => @post) 
    end

    def new
       @post = Post.new 
       @category = Category.all
    end

    def create
       @post = Post.new(post_params)
       if @post.save
          redirect_to posts_path, :notice => "Your post has been saved"
       else
          render "new"          
       end 
    end

    def edit
       @post = Post.find(params[:id])   
    end

    def update
       @post = Post.find(params[:id])   
       if @post.update_attributes(post_params)
          redirect_to post_path, notice => "Your post has been updated"
       else
          render "edit" 
       end  
    end


    def destroy
       @post = Post.find(params[:id])   
       @post.destroy 
       redirect_to posts_path, notice => "Your post has been deleted"
    end

    private
    def category_params
      params.require(:category).permit(:name);
    end
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :admin_user_id);
    end
    def admin_user_params
      params.require(:admin_user).permit(:name)
    end
end
