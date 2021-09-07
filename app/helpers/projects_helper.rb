# frozen_string_literal: true

module ProjectsHelper

	def new_bugs(project)
		project.bugs.new_bugs.with_attached_screenshot
	end

    def assigned_bugs(project)
		project.bugs.assigned.with_attached_screenshot
	end

	def completed_bugs(project)
		project.bugs.completed.with_attached_screenshot
	end

end
