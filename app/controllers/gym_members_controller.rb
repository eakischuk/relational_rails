class GymMembersController < ApplicationController
  def index
    @gym_members = GymMember.all
  end

  def show
    @gym_member = GymMember.find(params[:member_id])
  end

  def edit
    @gym_member = GymMember.find(params[:member_id])
  end

  def update
    member = GymMember.find(params[:member_id])
    member.update({
      first_name: params[:first_name],
      last_name: params[:last_name],
      belay_status: params[:belay_status],
      monthly_checkins: params[:checkins],
      })
    member.save
    redirect_to "/gym_members/#{member.id}"
  end
end
