# frozen_string_literal: true

class RemoveTypeFromBugs < ActiveRecord::Migration[6.1]
  def change
    remove_column :bugs, :type
  end
end
