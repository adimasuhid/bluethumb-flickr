module Pagination
  DEFAULT_PAGE = 1
  PER_PAGE = 12

  def self.create(results: nil, per_page: PER_PAGE, current_page: DEFAULT_PAGE)
    WillPaginate::Collection.create(
      current_page,
      per_page,
      results.total) do |pager|
        pager.replace(results)
    end
  end
end
