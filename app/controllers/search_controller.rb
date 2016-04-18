class SearchController < ApplicationController
  def show
    @results = NrelService.new.search(params["q"])
  end
end
