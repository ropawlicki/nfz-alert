# frozen_string_literal: true

# user query controller
class UserQueriesController < ApplicationController
  before_action :require_authentication

  def update
    @user_query = UserQuery.find(params[:id])
    @user_query.update(update_params)
  end

  def destroy
    current_user.user_queries.find_by(query_id: params[:id]).destroy
    redirect_to authenticated_root_path
  end

  private

  def update_params
    params.permit(:visited_results_at)
  end
end
