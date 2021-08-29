class ClimbingGymsController < ApplicationController
  def index
    @gyms = ClimbingGym.order_by_creation
  end

  def show
    @gym = ClimbingGym.find(params[:gym_id])
  end

  def new
  end

  def create
    climbing_gym = ClimbingGym.new({
      name: params[:name],
      ropes: params[:ropes_available],
      total_routes: params[:total_routes]
    })
    climbing_gym.save
    redirect_to '/climbing_gyms'
  end
end
