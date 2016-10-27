class HomeController < ApplicationController
  def index
    @mainTitle = 'Welcome'
    @mainDesc  = 'Enterprise Co.'
  end

  def second_index
    @mainTitle = 'Welcome 2'
    @mainDesc  = 'Enterprise Co.'
  end
end
