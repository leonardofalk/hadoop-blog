class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_query

  def set_query
    @q = []
  end
end
