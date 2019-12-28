class TweetsController < ApplicationController
  @tweets = Tweet.all.order("id DESC")
end
