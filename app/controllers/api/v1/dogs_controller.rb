class Api::V1::DogsController < Api::V1::BaseController
  before_action :set_dog, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  def index
    @dogs = Dog.all.order(updated_at: :desc)
  end

  def show

  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      render :show
    else
      render_error
    end
  end

  def update
    if @dog.update(dog_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    if @dog.destroy
      render json: { status: :story_deleted }
    else
      render_error
    end
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    p params
    params.require(:dog).permit(:name, :description, :image)
  end

  def render_error
    render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
  end
end
