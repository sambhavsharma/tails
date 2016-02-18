class TweetsController < ApplicationController

    #before_filter :load_tweets

    def index
       if params[:username].present?
            username = params[:username]
            options = {:count => 20}
            # $twitter.user_timeline(username,options).each do |tweet|
            #     print tweet.text
            # end
            @tweets = $twitter.user_timeline(username,options)
        end
    end

    def get_tweets

        if params[:username].present?
            username = params[:username]
            options = {:count => 20}
            # $twitter.user_timeline(username,options).each do |tweet|
            #     print tweet.text
            # end
            @tweets = $twitter.user_timeline(username,options)
        end

    end

end
