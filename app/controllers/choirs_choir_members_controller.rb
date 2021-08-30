class ChoirsChoirMembersController < ApplicationController
  def index
    @choirs_choir_members = ChoirMember.where(choir_id: params[:choir_id])
  end
end
