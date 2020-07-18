class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_ransack

  def index
    @users_all = User.all

    respond_to do |format|
      format.html
      format.csv { send_data @users_all.generate_csv, filename: "users-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
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
      redirect_to users_url, notice: "ユーザ「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: "ユーザ「#{@user.name}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "ユーザ「#{@user.name}」を削除しました"
  end

  def import
    if params[:file].nil?
      redirect_to users_url, alert: "CSVが添付されていません"
    else
      @users.import(params[:file])
      if $import_errors.nil?
        redirect_to users_url, notice: "CSV取り込みが完了しました"
      else
        str = <<~EOS.gsub(/,|:/, "<br>　-")
          CSVインポート失敗<br>,
          ★ヒント★：#{$import_errors}
        EOS
        flash.now[:alert] = str.html_safe
        render :index
      end
    end
  end

  def reset
    if User.any?
      begin
        ActiveRecord::Base.transaction do
          User.destroy_all
          logger.info("info：Userテーブル全データの削除完了")
          # byebug
        end
      rescue => e
        logger.error("------------------------------------")
        logger.error("error: データリセットに失敗しました")
        logger.error("------------------------------------")
        logger.error e
        logger.error("------------------------------------")
        logger.error e.backtrace.join("\n")
        logger.error("------------------------------------")
        $reset_errors = e.record.errors.messages
      end
      redirect_to users_url, notice: "データリセットが完了しました"
    else
      str = <<~EOS.gsub(/,|:/, "<br>　-")
          データリセットに失敗しました<br>,
          ★ヒント★：#{$reset_errors}
      EOS
      flash.now[:alert] = str.html_safe
      render :index
    end
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
