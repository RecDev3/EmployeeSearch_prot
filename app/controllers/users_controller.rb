class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url, notice: "ユーザ「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to users_url, notice: "ユーザ「#{@user.name}」を更新しました。"
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url, notice: "ユーザ「#{user.name}」を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:emproyee_id, :name, :dept1, :dept2, :dept3, :email)
  end
end
