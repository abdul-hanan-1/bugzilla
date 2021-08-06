class DropProjectsUsers < ActiveRecord::Migration[6.1]
  def change
    def up
    drop_table :projects_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
end