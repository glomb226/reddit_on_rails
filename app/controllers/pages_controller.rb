class PagesController < ApplicationController
  def index
    @links = Link.includes(:user).paginate(:page => params[:page]).order('created_at DESC')
    respond_to do |format|
      format.html #show da default view
      format.json {render :json => @links}
    end #format
  end

end
