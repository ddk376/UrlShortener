class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :shortened_url_id, null: false
      t.integer :upvote, default: 0
      t.integer :downvote, default: 0
      t.timestamps
    end
  end
end
