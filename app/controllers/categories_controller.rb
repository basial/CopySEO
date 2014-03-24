class CategoriesController < ApplicationController
before_filter :set_category, only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      @category.update_attribute(:last_edited_by, current_user.id)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.delete
    redirect_to categories_path
  end

private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description, :avatar)
  end
end