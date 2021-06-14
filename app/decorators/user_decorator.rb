class UserDecorator < Draper::Decorator
  delegate_all

  def acorn_exist?
    self.acorn.number > 0
  end

end
