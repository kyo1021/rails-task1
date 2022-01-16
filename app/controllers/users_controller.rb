  class UsersController < ApplicationController
   def index
     @users = User.all
   end

   def new
     @user = User.new
   end

   def create
     @user = User.new(params.require(:user).permit(:title, :start_at, :end_at, :is_all_day, :memo))
     if @user.save
       flash[:notice_success] = "スケジュールを登録しました"
       redirect_to :users
     else
       flash[:notice_failure] = "スケジュールを登録できませんでした"
       render "new", status: :unprocessable_entity
     end
   end

   def show
     @user = User.find(params[:id])
   end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find(params[:id])
     if @user.update(params.require(:user).permit(:title, :start_at, :end_at, :is_all_day, :memo))
       flash[:notice_success] = "スケジュールを更新しました"
       redirect_to :users
     else
       flash[:notice_failure] = "スケジュールを更新できませんでした"
       render "edit", status: :unprocessable_entity
     end
   end

   def destroy
     @user = User.find(params[:id])
     @user.destroy
     flash[:notice_delete] = "スケジュールを削除しました"
     redirect_to :users, status: :see_other
   end
  end