class PostsController < ApplicationController

  def index
    # @page = params.fetch(:page, 1).to_i - 1
    # per_page = 5
    # @posts = Post.offset(@page*per_page).limit(per_page).order(:created_at)
    # @amount_of_pages = (Post.count.to_f/ per_page).ceil
    # without the gem
    @posts = Post.order(:created_at).page(params[:page]) 
  end

  def show
    @post = Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    if @post.update_attributes params[:post]
      redirect_to @post
    else
      render action: 'edit'
    end

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]

    if @post.save
      redirect_to @post
    else
      render action: 'new'
    end
  end

  def destroy
    @post = Post.find params[:id]

    if @post.destroy
      redirect_to posts_path
    else
      redirect_to @post
    end
  end

end
