class CreateUserAdvices < ActiveRecord::Migration
  def change
    create_table :user_advices do |t|
      t.belongs_to :user
      t.belongs_to :advice
      #t.boolean initialized as nil
      t.timestamps
    end
  end
end
