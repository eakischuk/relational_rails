class ChoirsController < ApplicationController
  def index
    @choir = Choir.order_by_creation
  end

  def show
    @choir = Choir.find_by(id: params[:id])
  end
end
