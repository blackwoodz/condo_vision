class UnitsController < ApplicationController
  def index
    @units = Unit.page(params[:page])
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new

    if @unit.save
      redirect_to "/units", :notice => "Unit created successfully."
    else
      render 'new'
    end
  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])


    if @unit.save
      redirect_to "/units", :notice => "Unit updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @unit = Unit.find(params[:id])

    @unit.destroy

    redirect_to "/units", :notice => "Unit deleted."
  end
end
