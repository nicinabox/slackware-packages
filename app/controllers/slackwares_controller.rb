class SlackwaresController < ApplicationController
  caches_page :index, :show

  def index
    @slackwares = SlackwareVersion.all
    render :index
  end

  def show
    @slackware = Rails.cache.fetch('slackware_version', expires_in: 15.minutes) do
      SlackwareVersion.includes(:versions).find(params[:id])
    end

    render :show
  end
end
