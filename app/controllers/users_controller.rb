class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(16)
  end

  def show
    @user = User.find(params[:id])
  end

  def owners
    @users = User.joins(:owned_units).distinct.page(params[:page]).per(16)
    render("index")
  end

  def residents
    @users = User.joins(:occupied_units).distinct.page(params[:page]).per(16)
    render("index")
  end

  def board_members
    @users = User.where("current_board_member = ?", true).page(params[:page]).per(16)
    render("index")
  end
end
