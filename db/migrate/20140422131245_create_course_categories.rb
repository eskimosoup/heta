class CreateCourseCategories < ActiveRecord::Migration
  def change
    create_table :course_categories do |t|
      t.string :title
      t.string :colour

      t.timestamps
    end
  end
end
