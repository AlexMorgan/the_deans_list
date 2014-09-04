class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    binding.pry
    if @sale.save
      flash[:notice] = "Your sale has been noted. Keep 'em coming!"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])

    if @sale.update(sale_params)
      redirect_to sale_path(@sale), notice: "Your sale has been updated"
    else
      render :edit
    end
  end

  def destroy
    @sale = Sale.find(params[:id]).destroy

    flash[:notice] = "Your sale has been deleted"
    redirect_to user_path(current_user)
  end

  private

  def sale_params
    params.require(:sale).permit(:quantity, :recipient, :date, :source, :gender, :amount_paid).merge(user: current_user)
  end
end

