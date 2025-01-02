class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    @categories = current_user.categories
  end

  def edit
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Categoria criada com sucesso"
    else
      @categories = current_user.categories
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "Categoria atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Categoria excluída com sucesso."
  end

  private
    def set_category
      @category = current_user.categories.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to categories_path, alert: "Categoria não encontrada."
    end

    def category_params
      params.require(:category).permit(:name, :color)
    end
end
