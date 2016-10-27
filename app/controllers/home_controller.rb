class HomeController < ApplicationController
  def index
    @mainTitle = 'Welcome'
    @mainDesc  = 'Enterprise Co.'
  end
end
