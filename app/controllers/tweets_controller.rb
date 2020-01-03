class TweetsController < ApplicationController
  # before_action :direct,except: [:index]
  def index
    @tweets = Tweet.all.order("id DESC")
  end

  def new
  end
  
  def create
    Tweet.create(title: only[:title],text: only[:text],image: only[:image])
    redirect_to :root
  end
  private
  def only
    params.permit(:title,:text,:image)
  end
  def direct
    redirect_to action: :index
  end
end