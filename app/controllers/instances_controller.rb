class InstancesController < ApplicationController
  before_action :set_experience, only: [:new, :create]
  before_action :set_instance, only: [:show, :edit, :update, :destroy]

  def index
    #@instances = Instance.all
    @instances = Instance.where(experience_id: params[:experience_id])
  end

  def show
  end

  def new
    @instance = Instance.new
  end

  def create
    @instance = Instance.new(instance_params)
    @instance.experience = @experience
    if @instance.save
      redirect_to experience_instances_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @instance.update(instance_params)
    redirect_to instances_path, notice: "Your instance was updated."
  end

  def destroy
    @instance.destroy
    redirect_to instances_path, notice: "Your instance was deleted"
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def set_instance
    @instance = Instance.find(params[:id])
  end

  def instance_params
    params.require(:instance).permit(:start_time, :end_time)
  end

end
