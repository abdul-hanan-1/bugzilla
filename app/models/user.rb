# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :bug_users, dependent: :destroy
  has_many :bugs, through: :bug_users

  validates :name, :email, presence: true

  ROLES = {manager: 'manager', developer: 'developer', qa: 'qa'}

  scope :developers, -> { where(user_type: ROLES[:developer]) }
  scope :qas, -> { where(user_type: ROLES[:developer]) }
  scope :not_yet_added, ->(id) { select { |u| !u.projects.pluck(:id).include?(id) } }

  def manager?
    user_type == ROLES[:manager]
  end

  def developer?
    user_type == ROLES[:developer]
  end

  def qa?
    user_type == ROLES[:qa]
  end
end
