class ToppagesController < ApplicationController
  # before_action :if_user_logged_in?

  def index
    if logged_in?
      # form用
      # @content = current_user.contents.build
      # @hoge = current_user.contents.build
      # 描画用
      @contents = current_user.contents
    end
  end
end
