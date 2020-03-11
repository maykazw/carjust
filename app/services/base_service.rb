class BaseService
  private_class_method :new

  def initialize(args = {})
  end

  class << self
    def call(*args)
      new(ActiveSupport::HashWithIndifferentAccess.new(*args)).call
    end
  end
end
