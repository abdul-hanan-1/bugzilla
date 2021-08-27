# frozen_string_literal: true

json.array! @bugs, partial: 'bugs/bug', as: :bug
