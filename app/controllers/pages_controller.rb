class PagesController < ApplicationController
  def index
    @links = Link.includes(:user).all
    respond_to do |format|
      format.html #show da default view
      format.json {render :json => @links}
    end #format
  end

end
