class PostsController < ApplicationController
  before_action :set_current_user, {only: [:index, :show, :edit, :update]}
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    
    if params[:image]
      @post.image_id = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_id}", image.read)
    end
    
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
    
  end
  

  
end