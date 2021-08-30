class ChoirsController < ApplicationController
  def index
    @choir = Choir.all
  end

  def show
    @choir = Choir.find_by(id: params[:id])
  end
end
