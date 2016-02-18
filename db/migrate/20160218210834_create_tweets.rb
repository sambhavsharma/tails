class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_id
      t.string :username
      t.text :text

      t.timestamps
    end
  end
end
