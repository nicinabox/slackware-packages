class PackagesController < ApplicationController
  def index
    @packages = Package.all
    render :index
  end

  def show
    @package = Package.friendly.find params[:id]
    render :show
    # render json: @package.to_json(
    #   include: {
    #     versions: {
    #       methods: [:slackware_version, :package_name]
    #     }
    #   }
    # )
  end
end
