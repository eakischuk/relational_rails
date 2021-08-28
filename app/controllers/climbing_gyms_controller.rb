class ClimbingGymsController < ApplicationController
  def index
    @gyms = ClimbingGym.all
  end
end
