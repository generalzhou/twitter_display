class CreateTweet < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :twitter_user
      t.string :text
      t.datetime :time_posted
      t.timestamps
    end
  end
end
