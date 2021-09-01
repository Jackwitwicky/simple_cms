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
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      flash[:notice] = "Page updated successfully"
      redirect_to pages_path
    else
      render 'edit'
    end
  end

  def delete
  end

  private

  def page_params
    params.require(:page).permit(:id, :name, :permalink, :position, :visible, :subject_id)
  end
end
