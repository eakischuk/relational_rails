class ClimbingGymGymMembersController < ApplicationController
  def index
    @gym = ClimbingGym.find(params[:gym_id])
    min = params[:minimum_checkins]
    if min != nil
      @members = @gym.sort_members(params[:order]).checkin_min(min)
    else
      @members = @gym.sort_members(params[:order])
    end
  end

  def new
    @gym = ClimbingGym.find(params[:gym_id])
  end

  def create
    gym_member = GymMember.new({
      first_name: params[:first_name],
      last_name: params[:last_name],
      belay_status: params[:belay_status],
      monthly_checkins: params[:monthly_checkins],
      climbing_gym_id: params[:gym_id]
      })
    gym_member.save
    redirect_to "/climbing_gyms/#{params[:gym_id]}/gym_members"
  end
end
