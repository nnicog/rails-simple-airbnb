class FlatsController < ApplicationController
  before_action :find_flat, only: %i[edit update show destory]
  def index
    @flats = Flat.all
  end

  def show
  end
  def new
    @flat = Flat.new
  end
  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end
  def edit
  end
  def update
    @flat.update
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end
  def destroy
    @flat.destroy
  end
  private
  def flat_params
    params.require(:flat).permit(%i[name address])
  end
  def find_flat
    @flat = Flat.find(params[:id])
  end
end
