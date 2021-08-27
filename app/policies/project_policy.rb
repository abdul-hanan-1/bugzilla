# frozen_string_literal: true

class ProjectPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def update?
    user.manager?
  end

  def show?
    user.manager?
  end

  def qa_show?
    user.qa?
  end

  def developer_show?
    user.developer?
  end

  def create?
    user.manager?
  end

  def destroy?
    user.manager?
  end

  def add_user?
    user.manager?
  end

  def remove_user?
    user.manager?
  end

  def bugs_bucket?
    user.developer?
  end

  def add_bug?
    user.qa?
  end
end
