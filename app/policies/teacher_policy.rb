class CoursesPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def index?
      true
    end
  
    def new?
      if user.is_a?(Admin)
        user.admin? || user.director? || user.secretary?
      else
        false
      end
    end
  
    def edit?
      if user.is_a?(Admin)
        user.admin? || user.director? || user.secretary?
      else
        false
      end
    end
  
    def show?
      if user.is_a?(Admin)
        true
      else
        false
      end
    end
  
    def update?
      if user.is_a?(Admin)
        user.admin? || user.director? || user.secretary?
      else
        false
      end
    end
  
    def destroy?
      if user.is_a?(Admin)
        user.admin? || user.director? || user.secretary?
      else
        false
      end
    end
  
    def create?
      if user.is_a?(Admin)
        user.admin? || user.director? || user.secretary?
      else
        false
      end
    end
    
  end