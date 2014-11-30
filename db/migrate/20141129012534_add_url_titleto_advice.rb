class AddUrlTitletoAdvice < ActiveRecord::Migration
  def change
    add_column :advices, :title, :string, :default => ""
  end
end
