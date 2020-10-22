class CategoriesController < ApplicationController
skip_before_action :require_login, only: [:show, :create]

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.find(params[:category][:id])
    redirect_to category_path(@category)
  end
end