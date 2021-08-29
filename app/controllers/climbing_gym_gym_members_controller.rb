class ClimbingGymGymMembersController < ApplicationController
  def index
    @gym = ClimbingGym.find(params[:gym_id])
    @members = @gym.gym_members
  end
end
