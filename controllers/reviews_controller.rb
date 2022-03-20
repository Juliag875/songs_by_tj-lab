class ReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def create
    review = Review.create!(review_params)
    render json: review.song, status: :ok
  end

  private

  def review_params
    params.permit(:song_id, :super_fan_id, :rating, :comment)
  end

  def handle_invalid_record(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    # render json: {errors: exception.message}, status: :unprocessable_entity
  end

end
