class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
      flash[:notice] = '新規コメントが送信されました。' 
    else
      flash[:notice] = '入力に不備があります'
      render :new
    end
  end

  def edit
      @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to root_path
      flash[:notice] = 'コメントが編集されました。' 
    else
      flash[:notice] = '入力に不備があります'
      render :edit
    end
  end





  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end


end
