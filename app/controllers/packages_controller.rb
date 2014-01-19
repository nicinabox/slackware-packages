class PackagesController < ApplicationController
  def index
    render json: Package.all
  end

  def show
    @package = Package.find_by(name: params[:id])
    render json: @package.to_json(
      include: {
        versions: {
          methods: [:slackware_version, :fullpath]
        }
      }
    )
  end
end