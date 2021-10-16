class Api::V1::ReviewsController < ApplicationController

  before_action :set_review, only: [:show]

  # GET /reviews
  def index
    if logged_in?
    @reviews = current_user.reviews

    render json: ReviewSerializer.new(@reviews)

    else 
      render json: {
        error: "You must be logged in to see your reviews"
      }
    end
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    
    if @review.save
      render json: ReviewSerializer.new(@review), status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    review_id = params[:id].to_i
    @review = Review.find(review_id)
    if @review.update(review_params)
      render json: ReviewSerializer.new(@review), status: :ok
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    delete_id = params[:id].to_i
    @review = Review.find(delete_id)
    
    if @review.destroy
      render json:  { data: "Review deleted successfully" }, status: :ok
    else
      error_resp = {
        error: "Review not deleted"
      }
      render json: error_resp, status: :unprocessable_entity
    
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:user_id, :rec_area_id, :description, :date, :nature_review, :amenities_review, :activities_review, :family_review, :picture)
    end
end

