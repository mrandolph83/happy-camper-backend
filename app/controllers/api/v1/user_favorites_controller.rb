class Api::V1::UserFavoritesController < ApplicationController
  
    
    # POST /user_user_favorites
    def create
      @user_favorite = UserFavorite.new(user_favorite_params)
  
      if @user_favorite.save
        render json: @user_favorite, status: :created, location: @user_favorite
      else
        render json: @user_favorite.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /user_favorites/1
    def destroy
      @user_favorite.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user_favorite
        @user_favorite = UserFavorite.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_favorite_params
        params.require(:user_favorite).permit(:user_id, :rec_area_id)

      end
  end


