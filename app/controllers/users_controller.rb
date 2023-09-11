class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user
      @name = @user.name # @userの名前属性にアクセス
      @prototypes = @user.prototypes # @userのプロトタイプにアクセス
    else
      # 指定されたidのユーザーが存在しない場合の処理
      # 404ページを表示するか、適切なアクションを取ることができます
      render status: :not_found
    end
  end
end
