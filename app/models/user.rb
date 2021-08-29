# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :bug_users, dependent: :destroy
  has_many :bugs, through: :bug_users
  validates :name, :email, presence: true
  Role = ['manager','developer','qa']
  def manager?
    user_type == Role[0]
  end

  def developer?
    user_type == Role[1]
  end

  def qa?
    user_type == Role[2]
  end
  scope :developers, -> { where(user_type: 'developer') }
  scope :qas, -> { where(user_type: 'qa') }
  scope :not_yet_added, ->(id) { select { |u| !u.projects.pluck(:id).include?(id) } }
end
