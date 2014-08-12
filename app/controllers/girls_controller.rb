class GirlsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @girls = Girl.all.order(created_at: :asc)
  end

  def show
    @girl = Girl.friendly.find(params[:id])
  end

  def new
    @girl = Girl.new
  end

  def create
    @girl = Girl.new(girl_params)

    if @girl.save
      redirect_to girl_path(@girl), notice: "#{@girl.first_name} has been added"
    else
      render :new
    end
  end

  def edit
    @girl = Girl.friendly.find(params[:id])
  end

  def update
    @girl = Girl.friendly.find(params[:id])

    if @girl.update(girl_params)
      redirect_to girl_path(@girl), notice: "#{@girl.first_name} #{@girl.last_name} has been updated"
    else
      render :edit, notice: "There were errors in your submission"
    end
  end

  def destroy
    @girl = Girl.friendly.find(params[:id]).destroy

    flash[:notice] = "#{@girl.first_name} #{@girl.last_name} has been removed"
    redirect_to girls_path
  end

  protected
  def girl_params
    params.require(:girl).permit(:first_name,
      :last_name,
      :year,
      :major,
      :month,
      :bio,
      :charity,
      :charity_url,
      :video_url,
      :image,
      :paypal_id)
  end
end
