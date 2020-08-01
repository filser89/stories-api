class Api::V1::CommentsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    @comment = Comment.new(comment_params)
    @dog = Dog.find(params[:dog_id])
    p @dog
    @comment.dog = @dog
    if @comment.save
      render json: {status: :comment_added}
    else
      render_error
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :content)
  end

  def render_error
    render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
  end
end
