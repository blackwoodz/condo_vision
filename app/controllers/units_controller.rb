class UnitsController < ApplicationController
  def index
    @q = Unit.ransack(params[:q])
    @units = @q.result(:distinct => true).includes(:ownership, :tenancy, :invoices, :owner, :tenant).page(params[:page]).per(10)

    render("units/index.html.erb")
  end

  def show
    @invoice = Invoice.new
    @unit = Unit.find(params[:id])

    render("units/show.html.erb")
  end

  def new
    @unit = Unit.new

    render("units/new.html.erb")
  end

  def create
    @unit = Unit.new

    @unit.unit_number = params[:unit_number]
    @unit.monthly_dues = params[:monthly_dues]

    save_status = @unit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/units/new", "/create_unit"
        redirect_to("/units")
      else
        redirect_back(:fallback_location => "/", :notice => "Unit created successfully.")
      end
    else
      render("units/new.html.erb")
    end
  end

  def edit
    @unit = Unit.find(params[:id])

    render("units/edit.html.erb")
  end

  def update
    @unit = Unit.find(params[:id])

    @unit.unit_number = params[:unit_number]
    @unit.monthly_dues = params[:monthly_dues]

    save_status = @unit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/units/#{@unit.id}/edit", "/update_unit"
        redirect_to("/units/#{@unit.id}", :notice => "Unit updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Unit updated successfully.")
      end
    else
      render("units/edit.html.erb")
    end
  end

  def destroy
    @unit = Unit.find(params[:id])

    @unit.destroy

    if URI(request.referer).path == "/units/#{@unit.id}"
      redirect_to("/", :notice => "Unit deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Unit deleted.")
    end
  end
end
