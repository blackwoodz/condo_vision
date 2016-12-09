class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    if (current_user.stripe_customer_id == nil)
      customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
      )
      current_user.stripe_customer_id = customer.id
      current_user.save
    else
      customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
      customer.email = params[:stripeEmail]
      customer.source = params[:stripeToken]
      customer.save
    end

    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  @payment = Payment.new

  @payment.invoice_id = 1
  @payment.amount = @amount
  @payment.status = "Succeeded"

  save_status = @payment.save


  # charge_details = Hash.new
  # charge_details[:invoice_id] = 1
  # charge_details[:amount] = @amount
  # charge_details[:status] = "Succeeded"
  #
  # charge(charge_details)

    # p = Payment.new
    # @payment.invoice_id = params[:invoice_id]
    # @payment.amount = params[:amount]
    # @payment.status = params[:status]
    #
    # save_status = @payment.save
    #
    # if save_status == true
    #   referer = URI(request.referer).path
    #
    #   case referer
    #   when "/payments/new", "/create_payment"
    #     redirect_to("/payments")
    #   else
    #     redirect_back(:fallback_location => "/", :notice => "Payment created successfully.")
    #   end
    # else
    #   render("payments/new.html.erb")
    # end

    # redirect_back(:fallback_location => "/", :notice => "Thanks! You paid $5.")
end

# def charge(charge_details)
#   @payment = Payment.new
#
#   @payment.invoice_id = charge_details[:invoice_id]
#   @payment.amount = charge_details[:amount]
#   @payment.status = charge_details[:status]
#
#   save_status = @payment.save
# end
