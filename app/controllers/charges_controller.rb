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

end
