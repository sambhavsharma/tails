class TweetsController < ApplicationController

    def index
       if params[:username].present?
            username = params[:username]
            options = {:count => 20}
            
            begin
                @tweets = $twitter.user_timeline(username,options)
                
                if @tweets.empty?
                    @message = "No tweets found for user #{username}"
                end
            rescue => e
                @message = "User not Found!"
                # redirect somewhere sensible?
            end
        end
    end

    def save_tweets
        if params[:tweets].present?
            tweets = params[:tweets]
 
            # ToDo: Bulk/Batch Insert using .create of ActiveRecord

            if tweets.empty?
                @message = "No tweets were selected"
            else
                tweets.each do |tweet|
                    tweet = tweet.split("&&")
                    @tweet = Tweet.new(:tweet_id => tweet[0], :username => tweet[1], :text =>tweet[2])
                    @tweet.save
                end
            end
        end
        render :template => "tweets/index", :locals => {:@message => "Tweets Saved!"}
    end

end
