class AddUpvoteToUserAdvices < ActiveRecord::Migration
  def change
    add_column :user_advices, :upvote, :boolean, :default => false
  end
end