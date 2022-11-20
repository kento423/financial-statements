class ContentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    if params[:content][:item_id] == ""
      item = Item.new(category_id: params[:content][:category_id], name: 'その他', is_approved: false)
      if item.save
        content = current_user.contents.build(item_id: item.id, amount: params[:content][:amount])
        content.save
      else
        flash.now[:danger] = "登録に失敗しました。"
      end
      redirect_to root_url
    elsif is_not_match_item_and_category(params[:content][:item_id], params[:content][:category_id])
      binding.pry
      flash[:danger] = "カテゴリと科目のどちらかが異なります。"
      redirect_to root_url
    else
      binding.pry
      @content = current_user.contents.build(content_params)
      if @content.save
        flash[:success] = "登録に成功しました"
      else
        flash.now[:danger] = "登録に失敗しました。"
      end
      redirect_to root_url
    end
  end

  def destroy
    @content.destroy
    flash[:success] = "#{@content.item.name}を削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def content_params
    params.require(:content).permit(:item_id, :amount)
  end
  
  def correct_user
    @content = current_user.contents.find_by(id: params[:id])
    unless @content
      redirect_to root_url
    end
  end
  
  def is_not_match_item_and_category(item_id, category_id)
    item = Item.find(item_id)
    return item.category_id != category_id.to_i
  end
end
