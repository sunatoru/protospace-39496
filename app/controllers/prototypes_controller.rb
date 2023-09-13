class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:edit, :show]
  before_action :ensure_user, only: [:edit, :update, :destroy]
  def index
    @prototypes = Prototype.includes(:user)
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to prototype_path(@prototype.id)
    else
      render :new
    end
  end

  def edit
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def update
    if @prototype.update(prototype_params)
        redirect_to prototype_path
    else 
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def ensure_user
    @prototypes = current_user.prototypes
    # これにより@prototypesに投稿したユーザーのプロトタイプをまとめて呼び出す変数
    @prototype = @prototypes.find_by(id: params[:id])
    # この単数のprototypeの中にまとめて呼び出した
    redirect_to root_path unless @prototype
    # この記述によりeditで他のユーザーが自分の投稿したprototypeではないのに編集ページのidを入力できれば編集できてたものをroot_pathによりホーム画面に戻す記述です。
  end
end
