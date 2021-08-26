class BugPolicy
  attr_reader :user, :bug

  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  def update?
    user.qa? || user.developer?
  end
  
  def show?
    user.manager? 
  end

  def create?
    user.qa? 
  end
  
  def destroy?
    user.qa? 
  end

  def assign_bug?
    user.developer? 
  end

  def mark_completed?
    user.developer? 
  end

end