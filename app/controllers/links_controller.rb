class LinksController < ApplicationController

  def index
    @links = Link.includes(:user).all
    respond_to do |format|
      format.html #show da default view
      format.json {render :json => @links}
    end #format
  end #index
  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { render :action => "create" }
        format.json { render :json => @link }
      else
        format.html { render :action => "new" }
        format.json { render :json => @link.errors, :status => :unprocessable_entity }
      end #if
    end #else
  end #create
  def new
    @link = Link.new(:name =>'link name',)
  end #new
  def show
    @link = Link.where(:id => params[:id]).first
  end #show
  def edit
    @link = Link.where(:id => params[:id]).first
  end #edit
  def update
    @link = Link.where(:id => params[:id]).first

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, :notice => 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, :status => :unprocessable_entity }
      end
    end
  end #update
  def destroy
    @link = Link.where(:id => params[:id]).first
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

end
