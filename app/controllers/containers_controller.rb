class ContainersController < ApplicationController
  def search
    q = params[:q]
    @container = Container.find_by_number q 
    render json: @container.to_json 
  end
end
