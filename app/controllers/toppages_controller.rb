class ToppagesController < ApplicationController
  # before_action :if_user_logged_in?
  before_action :require_user_logged_in

  def index
    # form用
    # @content = current_user.contents.build
    @content = Content.new
    # @hoge = current_user.contents.build
    # 描画用
    @contents = current_user.contents
    # @contents = current_user.contents.
  end
end
