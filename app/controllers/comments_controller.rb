class CommentsController < ApplicationController

    def create
        @micropost = Micropost.find(params[:comment][:micropost_id])
        @comment = @micropost.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to root_path
        else
            @feed_items = current_user.feed.paginate(page: params[:page])
            render 'static_pages/home'
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to root_url
    end



    private

    def comment_params
        params.require(:comment).permit(:comment)
    end

end
