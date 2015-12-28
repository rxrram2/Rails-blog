class PostCommentsController < InheritedResources::Base

    def create
       @post_comment = PostComment.new(post_comment_params)
       if @post_comment.save
          redirect_to @post_comment.post, :notice => "Your post comment has been saved"
       else
          render "new"          
       end 

    end
  private

    def post_comment_params
      params.require(:post_comment).permit(:name, :email, :body, :post_id)
    end
end

