class PiyocomicsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_piyocomic, only: [:edit, :show, :update, :destroy]

  def index
    @piyocomics = Piyocomic.all
  end

  def new
    @piyocomic = Piyocomic.new
  end

  def create
    #binding.pry
    @piyocomic = Piyocomic.new(piyocomic_params)
    if @piyocomic.save!
      redirect_to '/piyocomics'
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @piyocomic.update(piyocomic_params)
      redirect_to piyocomic_path(@piyocomic.id)
    else
      render :edit
    end
  end

  def destroy
    @piyocomic.destroy
    redirect_to '/piyocomics'
  end

  private
  def piyocomic_params
    params.require(:piyocomic).permit(:title, :introduction, :image ).merge(user_id: current_user.id)
  end

  def move_to_index
    #piyocomic = Piyocomic.find(params[:id])
    unless current_user.id == 1
      redirect_to root_path
    end
  end

  def set_piyocomic
    @piyocomic = Piyocomic.find(params[:id])
  end
  
end
