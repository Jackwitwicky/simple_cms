class PagesController < ApplicationController
  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notive] = "Page created successfully"
      redirect_to page_path(@page)
    else
      render 'new'
    end
  end

  def edit
  end

  def delete
  end

  private

  def page_params
    params.require(:page).permit(:id, :name, :permalink, :position, :visible, :subject_id)
  end
end
