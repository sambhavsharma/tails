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

    def save_tweets
        if params[:tweets].present?
            tweets = params[:tweets]
            tweets.each do |tweet|
                print tweet
            end
        end
        render :template => "tweets/index", :locals => {:@message => "Tweets Saved!"}
    end

end
