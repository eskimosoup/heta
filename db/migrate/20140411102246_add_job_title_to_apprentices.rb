class AddJobTitleToApprentices < ActiveRecord::Migration
  def change
    add_column :apprentices, :job_title, :string
  end
end
