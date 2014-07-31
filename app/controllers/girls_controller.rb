class GirlsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @girls = Girl.all
  end

  def show
    @girl = Girl.find(params[:id])
  end
end
