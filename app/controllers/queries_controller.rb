class QueriesController < ApplicationController
  def new
  end

  def create
    query = Query.find_or_create_by(query_params)
    query.user_queries.find_or_create_by(user_id: current_user.id)
  end

  def destroy
  end

  private

    def query_params
      params.permit(:case, :province, :locality, :benefit)
    end
end
