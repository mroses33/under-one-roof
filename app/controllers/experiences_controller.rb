class ExperiencesController < ApplicationController
  def index
    if params[:query].present?
      @experiences = Experience.search_experience(params[:query]).where.not(host_id: current_user.id)
      flash[:notice] = "Unfortunately, no results for #{params[:query]}" if @experiences.length.zero?
    elsif params[:category].present?
      category_id = params[:category].to_i
      y = Experience.where(id: ExperienceCategory.where(category_id: category_id).pluck(:experience_id).uniq)
      @experiences = y
    else
      x = Experience.all.where.not(host_id: current_user.id)
      # x = Experience.page(params[:page]).per(6)
      @experiences = x
    end
    @experiences = @experiences.page(params[:page]).per(6)

    if params[:filter].present?
      @experiences = @experiences.where(country: params[:filter].upcase)
    end

    @markers = @experiences.geocoded.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude,
        image_url: helpers.asset_url('9.png')
      }
    end

    @countries = []
    Experience.all.each do |experience|
      @countries << experience.country
    end
    @countries.uniq!
    #@countries.sort!
  end

  def show
    @experience = Experience.find(params[:id])
    @booking = Booking.new
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
    redirect_to user_path(current_user.id)
  end

  private

  def strong_params
    params.require(:experience).permit(:name, :tagline, :description, :spotify_url, :price, :country, :address, :kid_friendly, :duration, :max_guests, :language, photos: [], category_ids: [])
  end
end
