class SearchController < ApplicationController
  def index
    client = PhotoClient.new
    results = client.search(search_params[:q],
                            per_page: Pagination::PER_PAGE,
                            page: current_page)

    flash[:error]= "Search failed to connect" if !client.last_request_success?
    @results = Pagination.create(results: results, current_page: current_page)
  end

  private

  def search_params
    params.permit(:q, :page)
  end

  def current_page
    search_params[:page] || Pagination::DEFAULT_PAGE
  end
end
