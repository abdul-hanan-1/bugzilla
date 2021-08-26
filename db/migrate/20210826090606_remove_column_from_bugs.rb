class RemoveColumnFromBugs < ActiveRecord::Migration[6.1]
  def change
    remove_column :bugs, :screenshot
  end
end
