class ChoirMembersController < ApplicationController
  def index
    @choir_members = ChoirMember.all
  end

  def show
    @choir_member = ChoirMember.find_by(id: params[:id])
  end

  def edit
    @choir_member = ChoirMember.find_by(id: params[:id])
  end

  def update
    choir_member = ChoirMember.find_by(id: params[:id])

    choir_member.update({
      name: params[:name],
      age: params[:age],
      active: params[:active],
      voice_type: params[:voice_type]
      })
    choir_member.save
    redirect_to "/choir_members/#{choir_member.id}"
  end

  def destroy
    choir_member = ChoirMember.find_by(id: params[:id])
    choir_member.destroy
    redirect_to '/choir_members'
  end
end
