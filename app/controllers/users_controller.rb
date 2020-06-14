class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_ransack

  def index
    respond_to do |format|
      format.html
      format.csv { send_data @users.generate_csv, filename: "users-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
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
    if @user.update(user_params)
      redirect_to users_url, notice: "ユーザ「#{@user.name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "ユーザ「#{@user.name}」を削除しました。"
  end

  def import
    @users.import(params[:file])
    redirect_to users_url, notice: "CSV取り込み完了"
  end

  private

  def user_params
    params.require(:user).permit(:emproyee_id, :name, :name_kana, :image, :dept1, :dept2, :dept3, :position_name, :tel_extention, :tel_outside, :tel_mobile, :email, :location_name)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_ransack
    @q = User.sort_by_name.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).includes(image_attachment:[:blob])
  end
end
