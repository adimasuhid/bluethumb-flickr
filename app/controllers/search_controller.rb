class SearchController < ApplicationController
  def index
    client = PhotoClient.new
    results = client.search(search_params[:q],
                            per_page: per_page,
                            page: current_page)

    flash[:error]= "Search failed to connect" if !client.last_request_success?
    @results = paginated_results(results)
  end

  private

  def search_params
    params.permit(:q, :page)
  end

  def per_page
    12
  end

  def current_page
    search_params[:page] || 1
  end

  def paginated_results(results)
    WillPaginate::Collection.create(
      current_page,
      per_page,
      results.total) do |pager|
        pager.replace(results)
    end
  end
end
