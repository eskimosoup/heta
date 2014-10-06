class AddYearToApprentices < ActiveRecord::Migration
  def change
    add_column :apprentices, :year_attended, :date
  end
end
