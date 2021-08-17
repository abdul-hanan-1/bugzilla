class Bug < ApplicationRecord
   has_many :bug_users, dependent: :destroy
   has_many :users , through: :bug_users  
	belongs_to :project
	has_one_attached :screenshot
end
