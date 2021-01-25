class ContentsController < ApplicationController

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      reedirect_to root_path
    else
      render :new
    end
  end

  private
  def content_params
    params.require(:content).permit(:title, :introduction, :image).merge(user_id: current_user.id)
  end
  
end
