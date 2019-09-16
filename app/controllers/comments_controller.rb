class CommentsController < ApplicationController

    def create
        @post = Micropost.find(params[:Post_id])
        @comment = @post.Comment.create( comment_params)
        @comment.user_id = current_user.id
        @comment.save
        if 
            @comment.save
            redirect_to @post
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end
    
    def new
      @comment = comment.new
    end

    def destroy

    
    end
 
 
 
    private
    
    def comment_params
    params.require(:comment).permit(:comment)
    end

end
