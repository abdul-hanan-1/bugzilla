class AddDescriptionToBug < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :description, :text
  end
end
