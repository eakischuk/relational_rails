class ChoirsChoirMembersController < ApplicationController
  def index
    @choirs_choir_members = ChoirMember.where(choir_id: params[:choir_id])
    @choir = Choir.find_by(id: params[:choir_id])
  end

  def new
    @choir = Choir.find_by(id: params[:choir_id])
  end

  def create
    choir_member = ChoirMember.new({
      name: params[:name],
      age: params[:age],
      active: params[:active],
      voice_type: params[:voice_type]
      })
    choir_member.save
    redirect_to "/choirs/#{params[:choir_id]}/choir_members"
  end
end
