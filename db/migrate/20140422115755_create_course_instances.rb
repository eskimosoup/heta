class CreateCourseInstances < ActiveRecord::Migration
  def change
    create_table :course_instances do |t|
      t.integer :course_id
      t.date :start_date
      t.date :end_date
      t.boolean :display, :default => true

      t.timestamps
    end
  end
end
