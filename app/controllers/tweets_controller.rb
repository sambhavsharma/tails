class TweetsController < ApplicationController

    #before_filter :load_tweets

    def index
       if params[:username].present?
            username = params[:username]
            options = {:count => 20}
            @tweets = $twitter.user_timeline(username,options)
        end
    end

    def save_tweets
        if params[:tweets].present?
            tweets = params[:tweets]
 
            # ToDo: Bulk/Batch Insert using .create of ActiveRecord

            tweets.each do |tweet|
                tweet = tweet.split("&&")
                @tweet = Tweet.new(:tweet_id => tweet[0], :username => tweet[1], :text =>tweet[2])
                @tweet.save
            end
        end
        render :template => "tweets/index", :locals => {:@message => "Tweets Saved!"}
    end

end
