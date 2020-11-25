class ExperienceCategoriesController < ApplicationController
  def new
    @experience = Experience.find(params[:experience_id])
    @experience_category = ExperienceCategory.new
  end

  def create
    @experience = Experience.find(params[:experience_id])
    @experience_category = ExperienceCategory.new(strong_params)
    @experience_category.experience = @experience

    if @experience_category.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  private
  def strong_params
    params.require(:experience_category).permit(category_ids: [])
  end
end
