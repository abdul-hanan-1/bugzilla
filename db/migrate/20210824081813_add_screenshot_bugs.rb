class AddScreenshotBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :screenshot, :attachment
  end
end
