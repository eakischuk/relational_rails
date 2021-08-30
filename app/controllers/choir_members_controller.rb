class ChoirMembersController < ApplicationController
  def index
    @choir_members = ChoirMember.all
  end

  def show
    @choir_member = ChoirMember.find_by(id: params[:id])
  end
end
