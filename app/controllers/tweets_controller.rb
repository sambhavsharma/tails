class TweetsController < ApplicationController

    #before_filter :load_tweets

    def index
        options = {:count => 20}
        $twitter.user_timeline("sambhavsharma",options).each do |tweet|
          puts tweet.text
        end
    end
end
