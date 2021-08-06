class Bug < ApplicationRecord
	has_and_belongs_to_many :users
	belongs_to :project
	has_one_attached :screenshot
end
