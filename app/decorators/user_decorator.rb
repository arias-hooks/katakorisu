class UserDecorator < Draper::Decorator
  delegate_all

  def acorn_active?
    acorn.number.positive? && squirrel.number.positive?
  end
end
