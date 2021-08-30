class ClimbingGymsController < ApplicationController
  def index
    @gyms = ClimbingGym.order_by_creation
  end

  def show
    @gym = ClimbingGym.find(params[:gym_id])
  end
end
