# frozen_string_literal: true

json.extract! bug, :id, :title, :deadline, :status, :type, :created_at, :updated_at
json.url bug_url(bug, format: :json)
