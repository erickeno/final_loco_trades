class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def new
  	@post = Post.new
  end

  def create
  	if current_user
  		@post = current_user.posts.build(post_params)
  		if @post.save
  			redirect_to @post, notice: 'Post was successfully created'
  		else
  			render 'new'
  		end
  	end
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  		redirect_to @post, notice: 'Post was successfully updated.'
  	else
  		render 'edit'
  	end
  	
  end

  def index
  	@posts = Post.all
  end

  def show
    @album = Album.new
    @album.post_id = @post.id
  end

  def destroy
  	@post.destroy
  	redirect_to posts_url, notice: "the post has been deleted!"
  end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:title, :description, :value, :category, :city, :state, :exchange)
  end

  def correct_user
  	@post = current_user.posts.find_by(id: params[:id])
  	redirect_to(root_url , notice: "You don't have the right authorization to perform that action") if @post.nil?
  end
end
