class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :show, :update]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
  	@post = Post.new
    5.times { @post.albums.build }
  end

  def create
  	if current_user
  		@post = current_user.posts.build(post_params)
  		if @post.save
  			redirect_to @post, notice: 'Post was successfully created'
        # redirect_to new_post_album_path(@post), notice: 'Add images to your post below'
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
    @search = Post.search(params[:q])
    @posts = @search.result.page(params[:page]).per(20)
    #@search.build_condition
  end

  def show
    @album = Album.new
    @album.post_id = @post.id

    @commentable = find_commentable
    @comments = @commentable.comments.arrange(:order => :created_at)
    @comment = Comment.new
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
  	params.require(:post).permit(:title, :description, :value, :category, :city, :state, :exchange, albums_attributes: [:image])
  end

  def correct_user
  	@post = current_user.posts.find_by(id: params[:id])
  	redirect_to(root_url , notice: "You don't have the right authorization to perform that action") if @post.nil?
  end

  def find_commentable
    return params[:controller].singularize.classify.constantize.find(params[:id])
  end
end
