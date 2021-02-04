class IllustsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_illust, only: [:edit, :show, :update, :destroy]

  def index
    @illusts = Illust.all
  end

  def new
    @illust = Illust.new
  end

  def create
    #binding.pry
    @illust = Illust.new(illust_params)
    if @illust.save!
      redirect_to '/illusts'
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @illust.update(illust_params)
      redirect_to illust_path(@illust.id)
    else
      render :edit
    end
  end

  def destroy
    @illust.destroy
    redirect_to '/illusts'
  end

  def search
    @illusts = Illust.search(params[:keyword])
  end

  private
  def illust_params
    params.require(:illust).permit(:title, :introduction, :image ).merge(user_id: current_user.id)
  end

  def move_to_index
    #illust = Illust.find(params[:id])
    unless current_user.id == 1
      redirect_to root_path
    end
  end

  def set_illust
    @illust = Illust.find(params[:id])
  end

end
