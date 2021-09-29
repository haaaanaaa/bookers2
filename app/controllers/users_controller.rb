class UsersController < ApplicationController

  def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ３. トップ画面へリダイレクト
    redirect_to '/top'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    list = User.find(params[:id])
    list.update(list_params)
    redirect_to user_path(list.id)
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end