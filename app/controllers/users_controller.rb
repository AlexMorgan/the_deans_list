class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Your profile has been successfully updated"
    else
      render :edit, notice: "There were errors in your submission"
    end
  end

  protected

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
