class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @q = User.ransack(params[:q])
    # FIXME 名前順にソートする
    @users = @q.result(distinct: true).page(params[:page])
  end

  def show
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
  end

  def update
    @user.update!(user_params)
    redirect_to users_url, notice: "ユーザ「#{@user.name}」を更新しました。"
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "ユーザ「#{@user.name}」を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:emproyee_id, :name, :image, :dept1, :dept2, :dept3, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
