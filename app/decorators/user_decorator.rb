class UserDecorator < Draper::Decorator
  delegate_all

  def acorn_exist?
    acorn.number.positive?
  end
end
