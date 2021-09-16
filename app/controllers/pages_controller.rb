class PagesController < ApplicationController

  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to page_path(@page)
    else
      @page_count = Page.count + 1
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      flash[:notice] = "Page updated successfully"
      redirect_to pages_path
    else
      @page_count = Page.count
      render 'edit'
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page deleted successfully"
    redirect_to pages_path
  end

  private

  def page_params
    params.require(:page).permit(:id, :name, :permalink, :position, :visible, :subject_id)
  end
end
