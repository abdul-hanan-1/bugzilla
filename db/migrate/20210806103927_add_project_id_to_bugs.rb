class AddProjectIdToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :project_id, :integer
    add_index :bugs, :project_id
  end
end
