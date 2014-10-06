class AddSlugToCourseInstances < ActiveRecord::Migration
  def change
    add_column :course_instances, :slug, :string
    add_index :course_instances, :slug
  end
end
