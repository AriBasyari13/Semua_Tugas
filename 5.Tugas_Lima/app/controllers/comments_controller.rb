class CommentsController < ApplicationController
  def index
  end
  
   def new
    @comment = Comment.new(:article_id => params[:article_id])
  end

  def edit
  end
  
  def create
    @comment = Comment.new(params_comment)
    if @comment.save
      flash[:notice] = "Successfully created comment"
      redirect_to @comment.article
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed painting."
    redirect_to @comment.article
  end
  
  private 
    def params_comment
      params.require(:comment).permit(:article_id, :user_is, :content, :status)
 
  end
end
