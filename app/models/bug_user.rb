# frozen_string_literal: true

class BugUser < ApplicationRecord
  belongs_to :bug
  belongs_to :user
end
