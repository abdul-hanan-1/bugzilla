class RemoveCreatorFromProject < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :creator
  end
end
