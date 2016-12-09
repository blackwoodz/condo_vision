class InvoicesController < ApplicationController
  def index
    @q = Invoice.ransack(params[:q])
    @invoices = @q.result(:distinct => true).includes(:owner, :unit, :payments).page(params[:page]).per(10)

    render("invoices/index.html.erb")
  end

  def show
    @payment = Payment.new
    @invoice = Invoice.find(params[:id])

    render("invoices/show.html.erb")
  end

  def new
    @invoice = Invoice.new

    if (current_user.site_admin != true)
      redirect_back(:fallback_location => "/", :alert => "You are not a Site Admin, so you cannot create an invoice.")
    else
      render("invoices/new.html.erb")
    end
  end

  def create
    @invoice = Invoice.new

    @invoice.unit_id = params[:unit_id]
    @invoice.status = params[:status]
    @invoice.amount = params[:amount]
    @invoice.owner_id = params[:owner_id]
    @invoice.assessment_type = params[:assessment_type]

    if (current_user.site_admin != true)
      redirect_back(:fallback_location => "/", :alert => "You are not a Site Admin, so you cannot create an invoice.")
    else
      save_status = @invoice.save

      if save_status == true
        referer = URI(request.referer).path

        case referer
        when "/invoices/new", "/create_invoice"
          redirect_to("/invoices")
        else
          redirect_back(:fallback_location => "/", :notice => "Invoice created successfully.")
        end
      else
        render("invoices/new.html.erb")
      end
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])

    if (current_user.site_admin != true)
      redirect_back(:fallback_location => "/", :alert => "You are not a Site Admin, so you cannot delete an invoice.")
    else
      render("invoices/edit.html.erb")
    end
  end

  def update
    @invoice = Invoice.find(params[:id])

    @invoice.unit_id = params[:unit_id]
    @invoice.status = params[:status]
    @invoice.amount = params[:amount]
    @invoice.owner_id = params[:owner_id]
    @invoice.assessment_type = params[:assessment_type]

    save_status = @invoice.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/invoices/#{@invoice.id}/edit", "/update_invoice"
        redirect_to("/invoices/#{@invoice.id}", :notice => "Invoice updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Invoice updated successfully.")
      end
    else
      render("invoices/edit.html.erb")
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])

    if (current_user.site_admin != true)
      redirect_back(:fallback_location => "/", :alert => "You are not a Site Admin, so you cannot delete an invoice.")
    else
      @invoice.destroy

      if URI(request.referer).path == "/invoices/#{@invoice.id}"
        redirect_to("/", :notice => "Invoice deleted.")
      else
        redirect_back(:fallback_location => "/", :notice => "Invoice deleted.")
      end
    end
  end
end
