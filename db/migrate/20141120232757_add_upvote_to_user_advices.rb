class AddUpvoteToUserAdvices < ActiveRecord::Migration
  def change
    add_column :user_advices, :vote, :boolean, :default => nil
  end
end
