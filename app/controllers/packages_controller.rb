class PackagesController < ApplicationController
  caches_page :index, :show

  def index
    if params[:q]
      @packages = Package.friendly.where "slug LIKE ?", "%#{params[:q]}%"
    else
      @packages = Package.all
    end

    render :index
  end

  def show
    @package = Package.friendly.find params[:id]
    render :show
  end
end
