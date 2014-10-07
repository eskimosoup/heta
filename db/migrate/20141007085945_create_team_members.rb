class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer :position
      t.string :name
      t.string :job_title
      t.text :summary
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
