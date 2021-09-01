class SectionsController < ApplicationController
  def index
    @sections = Section.sorted
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end
end
