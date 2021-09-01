class DemoController < ApplicationController
  layout false

  def index
  end

  def hello
    @id = params[:id]
    @page = params[:page]
  end

  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end
end
