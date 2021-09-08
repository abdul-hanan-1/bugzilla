
class Bug < ApplicationRecord
  has_many :bug_users, dependent: :destroy
  has_many :users, through: :bug_users

  belongs_to :project

  has_one_attached :screenshot

  validates :title, :kind, :status, :deadline , presence: true
  validates :screenshot, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg']}

  STATUSES = {new: 'new', assigned: 'assigned', completed: 'completed'}

  scope :new_bugs, -> { where(status: STATUSES[:new]) }
  scope :assigned, -> { where(status: STATUSES[:assigned]) }
  scope :completed, -> { where(status: STATUSES[:completed]) }

end
