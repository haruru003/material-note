class ComicsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_comic, only: [:edit, :show, :update, :destroy]

  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
  end

  def create
    #binding.pry
    @comic = Comic.new(comic_params)
    if @comic.save!
      redirect_to '/comics'
    else
      render :new
    end
  end

  def show
  end
  
  def edit
    @comic = Comic.find(params[:id])
  end

  def update
    if @comic.update(comic_params)
      redirect_to comic_path(@comic.id)
    else
      render :edit
    end
  end

  def destroy
    @comic.destroy
    redirect_to '/comics'
  end

  private
  def comic_params
    params.require(:comic).permit(:title, :introduction, :image ).merge(user_id: current_user.id)
  end

  def move_to_index
    #comic = Comic.find(params[:id])
    unless current_user.id == 1
      redirect_to root_path
    end
  end

  def set_comic
    @comic = Comic.find(params[:id])
  end
  
end

