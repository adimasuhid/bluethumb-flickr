class SearchController < ApplicationController
  def index
    if search_params[:q].present?
      client = PhotoClient.new
      @results = client.search(search_params[:q])

      flash[:error]= "Search failed to connect" if !client.last_request_success?
    else
      @results = []
    end
  end

  private

  def search_params
    params.permit(:q)
  end
end
