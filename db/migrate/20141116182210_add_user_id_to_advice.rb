class AddUserIdToAdvice < ActiveRecord::Migration
  def change
    add_column :advices, :user_id, :integer
  end
end
