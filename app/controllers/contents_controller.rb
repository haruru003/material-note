class ContentsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_content, only: [:edit, :show, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @content.update(content_params)
      redirect_to content_path(@content.id)
    else
      render :edit
    end
  end

  def destroy
    @content.destroy
    redirect_to root_path
  end

  private
  def content_params
    params.require(:content).permit(:title, :introduction )
  end

  def move_to_index
    #content=Content.find(params[:id])
    unless current_user.id == 1
      redirect_to root_path
    end
  end

  def set_content
    @content = Content.find(params[:id])
  end
  
end
