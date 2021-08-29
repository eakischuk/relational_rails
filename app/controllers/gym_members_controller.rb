class GymMembersController < ApplicationController
  def index
    @gym_members = GymMember.all
  end

  def show
    @gym_member = GymMember.find(params[:member_id])
  end
end
