class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order("id DESC")
  end

  def new
  end
  def create
    Tweet.create(title: only[:title],text: only[:text],image: only[:image])
  end


  private
  def only
    params.permit(:title,:text,:image)
  end
end
