class QueryController < ApplicationController
  def create
  end

  def destroy
  end

  def fetch
    query = Query.first
  end

  private

    def http_params
      
    end
end
