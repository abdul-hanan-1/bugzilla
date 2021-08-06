class DropProjectUsers < ActiveRecord::Migration[6.1]
  def up
    drop_table :project_users
    drop_table :bug_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

