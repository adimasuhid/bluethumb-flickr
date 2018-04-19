class SearchController < ApplicationController
  def index
    if search_params[:q].present?
      client = PhotoClient.new
      @results = client.search(search_params[:q])
    else
      @results = []
    end
  end

  private

  def search_params
    params.permit(:q)
  end
end
