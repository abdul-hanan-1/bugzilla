class CreateBugUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :bug_users do |t|
      t.belongs_to :bug
      t.belongs_to :user  
      t.timestamps
    end
  end
end
