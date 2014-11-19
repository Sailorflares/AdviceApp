class CreateUserAdvices < ActiveRecord::Migration
  def change
    create_table :user_advices do |t|

      t.timestamps
    end
  end
end
