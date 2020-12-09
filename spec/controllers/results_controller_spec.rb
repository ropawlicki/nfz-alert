# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResultsController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @query = create(:query)
    @user_query = UserQuery.create(user_id: @user.id, query_id: @query.id)
  end

  describe 'GET index' do
    it 'assigns query' do
      get :index, params: { id: @query.id }
      query = assigns(:query)

      expect(query.id).to eq(@query.id)
    end

    it 'assigns user_query' do
      get :index, params: { id: @query.id }
      user_query = assigns(:user_query)

      expect(user_query.id).to eq(@user_query.id)
    end

    it 'assigns results sorted by date (from soonest to latest)' do
      sooner_result = create(:result, date: '2019-01-01')
      QueryResult.create(query_id: @query.id, result_id: sooner_result.id)
      later_result = create(:result, date: '2020-01-01')
      QueryResult.create(query_id: @query.id, result_id: later_result.id)
      get :index, params: { id: @query.id }
      results = assigns(:results)

      expect(results.first.benefit).to eq(sooner_result.benefit)
    end
  end
end
