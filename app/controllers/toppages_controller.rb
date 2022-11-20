class ToppagesController < ApplicationController
  before_action :require_user_logged_in

  def index
    # form用
    @content = Content.new
    # 描画用
    @contents = current_user.contents
  end
end
