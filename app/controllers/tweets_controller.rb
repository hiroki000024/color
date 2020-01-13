class TweetsController < ApplicationController
  before_action :direct,except: [:index]
  def index
    @tweets = Tweet.includes(:user).order("id DESC").page(params[:page]).per(12)
  end

  def new
  end
  
  def create
    Tweet.create(title: only[:title],text: only[:text],image: only[:image],user_id: current_user.id,name: current_user.name)
    redirect_to :root
  end
  def destroy
    @user = current_user
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to "/users/#{@user.id}"
  end
  def show
    @tweets = Tweet.find(params[:id])
    @comments= @tweets.comments.includes(:user).order("id DESC")
  end
  def edit
  end
  def update
  end
  private
  def only
    params.permit(:title,:text,:image)
  end
  def direct
    redirect_to action: :index unless user_signed_in?
  end
end