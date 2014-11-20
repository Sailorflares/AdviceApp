class CreateAdvices < ActiveRecord::Migration
  def change
    create_table :advices do |t|
      t.text :url

      t.timestamps
    end
  end
end
