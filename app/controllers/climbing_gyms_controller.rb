class ClimbingGymsController < ApplicationController
  def index
    @gyms = ClimbingGym.all
  end

  def show
    @gym = ClimbingGym.find(params[:id])
  end
end
