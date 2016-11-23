class TenanciesController < ApplicationController
  def index
    @q = Tenancy.ransack(params[:q])
    @tenancies = @q.result(:distinct => true).includes(:tenant, :unit).page(params[:page]).per(10)

    render("tenancies/index.html.erb")
  end

  def show
    @tenancy = Tenancy.find(params[:id])

    render("tenancies/show.html.erb")
  end

  def new
    @tenancy = Tenancy.new

    render("tenancies/new.html.erb")
  end

  def create
    @tenancy = Tenancy.new

    @tenancy.tenant_id = params[:tenant_id]
    @tenancy.unit_id = params[:unit_id]
    @tenancy.start_date = params[:start_date]
    @tenancy.end_date = params[:end_date]

    save_status = @tenancy.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tenancies/new", "/create_tenancy"
        redirect_to("/tenancies")
      else
        redirect_back(:fallback_location => "/", :notice => "Tenancy created successfully.")
      end
    else
      render("tenancies/new.html.erb")
    end
  end

  def edit
    @tenancy = Tenancy.find(params[:id])

    render("tenancies/edit.html.erb")
  end

  def update
    @tenancy = Tenancy.find(params[:id])

    @tenancy.tenant_id = params[:tenant_id]
    @tenancy.unit_id = params[:unit_id]
    @tenancy.start_date = params[:start_date]
    @tenancy.end_date = params[:end_date]

    save_status = @tenancy.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tenancies/#{@tenancy.id}/edit", "/update_tenancy"
        redirect_to("/tenancies/#{@tenancy.id}", :notice => "Tenancy updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Tenancy updated successfully.")
      end
    else
      render("tenancies/edit.html.erb")
    end
  end

  def destroy
    @tenancy = Tenancy.find(params[:id])

    @tenancy.destroy

    if URI(request.referer).path == "/tenancies/#{@tenancy.id}"
      redirect_to("/", :notice => "Tenancy deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Tenancy deleted.")
    end
  end
end
