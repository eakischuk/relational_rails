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

  def edit
    @gym = ClimbingGym.find(params[:gym_id])
  end

  def update
    climbing_gym = ClimbingGym.find(params[:gym_id])
    climbing_gym.update({
      name: params[:name],
      ropes: params[:ropes_available],
      total_routes: params[:total_routes]
      })
      climbing_gym.save
    redirect_to "/climbing_gyms/#{climbing_gym.id}"
  end

  def destroy
    climbing_gym = ClimbingGym.find(params[:gym_id])
    climbing_gym.destroy
    redirect_to '/climbing_gyms'
  end
end
