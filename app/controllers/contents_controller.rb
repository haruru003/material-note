class ContentsController < ApplicationController

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    #binding.pry
    @content = Content.new(content_params)
    if @content.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def content_params
    params.require(:content).permit(:title, :introduction, :image)
  end
  
end
