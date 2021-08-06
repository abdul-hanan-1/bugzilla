class CreateProjectsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :projects_users do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.timestamps
    end
    create_table :bugs_users do |t|
      t.belongs_to :bug
      t.belongs_to :user
      t.timestamps
    end
  end
end
