class ContentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @content = current_user.contents.build(content_params)
    if @content.save
      flash[:success] = "登録に成功しました"
      redirect_to root_url
    else
      flash.now[:danger] = "登録に失敗しました。"
    end
  end

  def update
  end

  def destroy
  end
  
  private
  
  def content_params
    params.require(:content).permit(:category, :item, :amount)
  end
  
  def correct_user
    @content = current_user.contents.find_by(id: params[:id])
    unless @content
      redirect_to root_url
    end
  end
end
