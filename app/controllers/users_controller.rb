class UsersController < ApplicationController
  def show
    @name = current_user.name
    @tweets = current_user.tweets.order("id DESC").page(params[:page]).per(12)
  end
end
