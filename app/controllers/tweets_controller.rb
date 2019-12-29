class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order("id DESC")
  end

  def new
  end
end
