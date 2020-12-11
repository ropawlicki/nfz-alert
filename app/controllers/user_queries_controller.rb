# frozen_string_literal: true

# user query controller
class UserQueriesController < ApplicationController
  def update
    @user_query = UserQuery.find(params[:id])
    @user_query.update(update_params)
  end

  def update_params
    params.permit(:visited_results_at)
  end
end
