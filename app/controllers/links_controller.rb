class LinksController < ApplicationController

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:article])

    @link.save
    redirect_to @link
  end

end
