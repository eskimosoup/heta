class AddLocationToCourseInstances < ActiveRecord::Migration
  def change
    add_column :course_instances, :training_location_id, :integer
  end
end
