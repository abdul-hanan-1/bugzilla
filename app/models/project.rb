class Project < ApplicationRecord
	has_many :project_users
	has_many :users , through: :project_users
	has_many :bugs, dependent: :destroy
end
