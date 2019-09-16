class CommentsController < ApplicationController

    def create
        @post = Micropost.find(params[:comment][:micropost_id])
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to root_path
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end

    def destroy


    end



    private

    def comment_params
        params.require(:comment).permit(:comment, :micropost_id)
    end

end
