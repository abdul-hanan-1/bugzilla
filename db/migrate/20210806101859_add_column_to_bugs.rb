# frozen_string_literal: true

class AddColumnToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :kind, :string
  end
end
