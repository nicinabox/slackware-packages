class ApplicationController < ActionController::Base
  self.perform_caching = true

  before_filter :set_format

  def set_format
    request.format = 'json'
  end
end
