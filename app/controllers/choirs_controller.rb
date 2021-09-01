class ChoirsController < ApplicationController
  def index
    @choir = Choir.order_by_creation
  end

  def show
    @choirs = Choir.find_by(id: params[:id])
  end

  def new
  end

  def create
    choir = Choir.new({
      name: params[:name],
      openings: params[:openings],
      active: params[:active]
      })

    choir.save
    redirect_to '/choirs'
  end

  def edit
    @choir = Choir.find(params[:id])
  end

  def update
    choir = Choir.find_by(id: params[:id])
    choir.update({
      name: params[:name],
      openings: params[:openings],
      active: params[:active]
      })
      choir.save
    redirect_to '/choirs/#{choir.choir_id}'
  end

  def destroy
    choir = Choir.find(params[:id])
    choir.destroy
    redirect_to '/choirs'
  end
end
