class GirlsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @girls = Girl.all
  end

  def show
    @girl = Girl.find(params[:id])
  end

  def new
    @girl = Girl.new
  end

  def create
    @girl = Girl.new(girl_params)

    if @girl.save
      redirect_to girls_path, notice: "#{@girl.first_name} has been added"
    else
      render :new
    end
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
      :image)
  end
end
