class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def about
  end

  def articles
  end

  def bibliographie
  end

  def enseignement
  end

  def info
  end

  def media
  end
end
