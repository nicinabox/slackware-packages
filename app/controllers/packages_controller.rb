class PackagesController < ApplicationController
  caches_page :index, :show

  def index
    @packages = Package.all
    render :index
  end

  def show
    @package = Package.friendly.find params[:id]
    render :show
  end
end
