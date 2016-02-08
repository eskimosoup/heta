class AddEventBriteLinkToCourseInstance < ActiveRecord::Migration
  def change
    add_column :course_instances, :eventbrite_link, :string, null: true
  end
end
