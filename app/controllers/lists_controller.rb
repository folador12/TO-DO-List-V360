class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[ new edit create update ]

  def index
    @lists = current_user.lists
    if params[:search_name].present?
      @lists = @lists.where("name ILIKE ?", "%#{params[:search_name]}%")
    end
    if params[:category_id].present?
      @lists = @lists.where(category_id: params[:category_id])
    end
    @categories = current_user.categories
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private
    def set_list
      @list = current_user.lists.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to lists_path, alert: "Lista não encontrada."
    end

    def set_categories
      @categories = current_user.categories
    end    

    def list_params
      params.require(:list).permit(:name, :category_id)
    end
end
