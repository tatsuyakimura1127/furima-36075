class StatusesController < ApplicationController
  def index
    @statuses = Status.order("created_at DESC")
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def status_params
    params.require(:status).permit(:title,:text,:genre_id)
  end

end