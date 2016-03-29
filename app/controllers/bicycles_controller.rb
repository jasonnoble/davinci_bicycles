class BicyclesController < ApplicationController
  def index
    @bicycles = Bicycle.all
  end

  def new
    @bicycle = Bicycle.new
  end

  def edit
    @bicycle = Bicycle.find(params[:id])
  end

  def update
    @bicycle = Bicycle.find(params[:id])
    if @bicycle.update(bicycle_params)
      redirect_to @bicycle,
                  notice: "It's been done!"
    else
      render action: 'edit'
    end
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    if @bicycle.save
      redirect_to bicycle_path(@bicycle),
                  notice: 'Here is your bike yo!'
    else
      render action: 'new'
    end
  end

  def show
    @bicycle = Bicycle.find(params[:id])
  end

  def destroy
    @bicycle = Bicycle.find(params[:id])
    if @bicycle.destroy
      redirect_to bicycles_path,
                  notice: "That wasn't nice"
    else
      redirect_to bicycles_path,
                  notice: 'Nope'
    end
  end

  private

  def bicycle_params
    params.required(:bicycle).permit(:owner, :color, :year)
  end
end
