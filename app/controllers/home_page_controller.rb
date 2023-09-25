class HomePageController < ApplicationController
  def landing_page
    @room = Room.new
  end
end
