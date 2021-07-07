class StaticPagesController < ApplicationController
  skip_before_action :login_required

  def terms; end

  def privacy; end

  def top; end

  def description; end
end
