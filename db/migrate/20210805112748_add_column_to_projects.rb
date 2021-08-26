class AddColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :manager, :string
  end
end
