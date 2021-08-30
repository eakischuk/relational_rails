class ChoirsController < ApplicationController
  def index
    @choir = Choir.all
  end

  def show
    @choir = Choir.all
  end
end
