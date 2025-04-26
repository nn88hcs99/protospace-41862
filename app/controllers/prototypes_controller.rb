class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @prototypes = Prototype.all.includes(:user)
  end

  def show
    @prototype = Prototype.find(params[:id]) # 選択されたプロトタイプを取得
    @comment = Comment.new # 新規コメントのための空オブジェクトを生成
    @comments = @prototype.comments.includes(:user)
  end
  

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
      if @prototype.save
        redirect_to root_path
      else
        render :new
      end  
  end

  def edit
    @prototype = Prototype.find(params[:id]) # IDに基づいてオブジェクトを取得
    unless user_signed_in? && @prototype.user == current_user
      redirect_to action: :index
    end
  end
  
  def update
     @prototype = Prototype.find(params[:id]) 
   if @prototype.update(prototype_params) # 成功した場合
     redirect_to prototype_path(@prototype)
   else
    render :edit
   end
  end

  def destroy
      @prototype = Prototype.find(params[:id])
      @prototype.destroy
      redirect_to root_path
  end


  private

  def prototype_params
     params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end

