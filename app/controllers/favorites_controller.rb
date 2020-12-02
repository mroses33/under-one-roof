class FavoritesController < ApplicationController

  def create
    @experience = Experience.find(params[:experience_id])
    @favorite = Favorite.create(experience: @experience, customer: current_user)
    redirect_to experience_path(@experience)
  end

  def destroy
    experience = Experience.find(params[:experience_id])
    favorite = Favorite.where(experience: experience, customer: current_user).first
    favorite.destroy
    redirect_to experience_path(experience)
  end
end
