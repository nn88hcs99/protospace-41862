class UsersController < ApplicationController
 def show
  @user = User.find(params[:id]) # リクエストされたユーザーを取得
  @prototypes = @user.prototypes
 end
end

