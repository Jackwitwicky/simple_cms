class SectionsController < ApplicationController
  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
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
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])

    if @section.update(section_params)
      flash[:notice] = 'Section updates successfully'
      redirect_to sections_path
    else
      render 'edit'
    end
  end

  def delete
  end

  private

  def section_params
    params.require(:section).permit(:id, :name, :position, :visible, :content, :content_type, :page_id)
  end
end