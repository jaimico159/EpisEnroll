class SemesterPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    if user.is_a?(Admin)
      user.admin? || user.director?
    else
      false
    end
  end

  def new?
    if user.is_a?(Admin)
      user.admin? || user.director?
    else
      false
    end
  end

  def edit?
    if user.is_a?(Admin)
      user.admin? || user.director?
    else
      false
    end
  end

  def show?
    if user.is_a?(Admin)
      user.admin? || user.director?
    else
      false
    end
  end

  def update?
    if user.is_a?(Admin)
      user.admin? || user.director?
    else
      false
    end
  end

  def destroy?
    if user.is_a?(Admin)
      user.admin? || user.director?
    else
      false
    end
  end

  def create?
    if user.is_a?(Admin)
      user.admin? || user.director?
    else
      false
    end
  end
  
end