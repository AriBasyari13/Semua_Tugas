class PosttingsController < ApplicationController
 
   def index
    @posttings = Postting.all
  end

  def new
    @postting = Postting.new
  end

  def destroy
    @postting = Postting.find(params[:id])
    @postting.destroy
    flash[:notice] = "Successfully destroyed painting."
    redirect_to action: 'index'
  end
  
  def edit
    @postting = Postting.find(params[:id])
  end

  def update
    @postting = Postting.find(params[:id])
    if @postting.update(postting_params)
      flash[:notice] = "Successfully updated"
      redirect_to action: 'index'
    else
      render :action => 'edit'
    end
  end

  def create
    @postting = Postting.new(postting_params)
    if @postting.save
      redirect_to action: 'index', notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created' 
    end
  end

  private
    def postting_params
      params.require(:postting).permit(:title, :content, :picture)
    end
end
