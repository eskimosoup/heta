class CreateCourseSearches < ActiveRecord::Migration
  def change
    create_table :course_searches do |t|
      t.string :keywords
      t.integer :course_category_id
      t.string :course_type

      t.timestamps
    end
  end
end
