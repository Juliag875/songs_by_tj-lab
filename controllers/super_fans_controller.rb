class SuperFansController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def destroy
    fan = SuperFan.find(params[:id])
    fan.destroy
    head :no_content
    # render json: {}
   end

   def index
    fans = SuperFan.all
    render json: fans
  end

   private 

   def not_found(error)
    render json: {errors: "#{error.model} Not Found"}, status: :not_found
  end

end
