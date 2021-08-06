class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.text :title
      t.datetime :deadline
      t.string :status
      t.string :type

      t.timestamps
    end
  end
end
