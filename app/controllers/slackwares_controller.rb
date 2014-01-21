class SlackwaresController < ApplicationController
  def index
    @slackwares = SlackwareVersion.all
    render :index
  end

  def show
    @slackware = SlackwareVersion.find params[:id]
    render :show
  end
end
