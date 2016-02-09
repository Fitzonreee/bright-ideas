class IdeasController < ApplicationController

  def index
    # automatically loads ideas index page
    user = User.find(session[:current_user_id])
    @user = User.find(user)

    # order by number of likes - most at the top (post.likes.count) -->

    @ideas = Post.all.order('likes_count DESC')
  end

  def create
    Post.create(text: params["idea"], user_id: session[:current_user_id])
    redirect_to '/bright_ideas'
  end

  def like
    # Update the likes_count column in the posts table
     # need a post_id
     # increment it by 1

    post = Post.find(params[:id])
    post.increment(:likes_count, by = 1)



    Like.create(post_id: params[:id], user_id: session[:current_user_id])
    redirect_to(:back)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to(:back)
  end

  def liked_by
    # show post and the people who like it
    post = Post.find(params[:id])
    @post_info = Post.find(post)
    # @liked_by = Like.where(post_id: params[:id])
    @liked_by = Like.select(:post_id, :user_id).where(post_id: params[:id]).distinct
  end

  def profile
    user = User.find(params[:id])
    @user = User.find(user)

    @total_likes = Like.where(user_id: params[:id])
    @total_posts = Post.where(user_id: params[:id])
    # I know you're not supposed to render views like this:
    render 'app/views/users/profile.html.erb'



    # get information of the author of the post
    # display how many post they have
    # display how many likes they have given
  end

end
