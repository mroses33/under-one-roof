class ExperiencesController < ApplicationController
  def index
    if params[:query].present?
      @experiences = Experience.search_experience(params[:query])
    else
      @experiences = Experience.all
    end

    @markers = @experiences.geocoded.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude
      }
    end
  end

  def show
    @experience = Experience.find(params[:id])
    # @average_rating = @experience.average_rating
  end

  def new
    @host = current_user
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(strong_params)
    @host = current_user
    @experience.host = @host
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def edit
    @host = current_user
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.update(strong_params)
    redirect_to experience_path(@experience)
  end

  def destroy
    experience = Experience.find(params[:id])
    experience.destroy
    redirect_to experiences_index_path
  end

  private

  def strong_params
    params.require(:experience).permit(:name, :description, :price, :country, :address, :kid_friendly, :duration, :max_guests, :language, photos: [], category_ids: [])
  end
end
