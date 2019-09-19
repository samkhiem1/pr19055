class LikesController < ApplicationController
    
    # def new
    #     @like = Like.new
    # end


    def create
        @micropost = Micropost.find(params[:micropost_id])
        @like = @micropost.likes.new
        @like.user_id = current_user.id
        if @like.save
            redirect_to root_path
        else
            @feed_items = current_user.feed.paginate(page: params[:page])
            render 'static_pages/home'
        end
    end
  

    def destroy
        @like = Like.find_by(id: params[:id])
        @like.destroy
        redirect_to root_path
    end


end
