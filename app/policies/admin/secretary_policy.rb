class Admin::SecretaryPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def home?
    if user.is_a?(Admin)
      user.secretary?
    else
      false
    end
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