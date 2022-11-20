class ContentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:update, :destroy]

  def create
    # content = User.first.contents.build(item_id: 24, amount: 10)
    @content = current_user.contents.build(content_params)
    if @content.save
      flash[:success] = "登録に成功しました"
      redirect_to root_url
    else
      flash.now[:danger] = "登録に失敗しました。"
      render 'toppages/index'
    end
  end

  def update
    flash[:success] = "update#{@content.item.name}"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @content.destroy
    flash[:success] = "#{@content.item.name}を削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def content_params
    params.require(:content).permit(:item_id, :amount)
    #TODO その他の分岐
    # [Item.new(category_id: 1, is_approved: false)]
  end
  
  def correct_user
    @content = current_user.contents.find_by(id: params[:id])
    unless @content
      redirect_to root_url
    end
  end
end
