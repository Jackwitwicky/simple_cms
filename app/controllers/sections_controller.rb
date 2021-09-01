class SectionsController < ApplicationController
  def index
    @sections = Section.sorted
  end

  def show
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      flash[:notice] = 'Section created successfully'
      redirect_to section_path @section
    else
      render 'new'
    end
  end

  def edit
  end

  def delete
  end

  private

  def section_params
    params.require(:section).permit(:id, :name, :position, :visible, :content, :content_type, :page_id)
  end
end
