class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 1500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Calendar Purchased',
      :currency    => 'usd'
    )

    # custome redirect - Get rid of this if you want to touch the charges#create page
    flash[:notice] = "Your order is being processed"
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
