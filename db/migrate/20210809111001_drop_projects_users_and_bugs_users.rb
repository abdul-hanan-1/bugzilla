class DropProjectsUsersAndBugsUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :projects_users
    drop_table :bugs_users
  end
end
