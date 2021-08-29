# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  has_many :bugs, dependent: :destroy
  validates :title, :manager, presence: true
  def list_of_users
    users.pluck(:id)
  end
end
