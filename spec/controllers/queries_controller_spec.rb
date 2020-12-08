# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QueriesController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  it 'assigns queries sorted by the time user created relation with them' do
    query1 = create(:query, benefit: 'Older but inserted later by user', created_at: Time.zone.now - 1.hour)
    UserQuery.create(user_id: @user.id, query_id: query1.id, created_at: Time.zone.now)
    query2 = create(:query, benefit: 'Newer but inserted sooner by user', created_at: Time.zone.now)
    UserQuery.create(user_id: @user.id, query_id: query2.id, created_at: Time.zone.now - 1.hour)
    get :index
    queries = assigns(:queries)

    expect(queries.first.benefit).to eq('Older but inserted later by user')
    expect(queries.second.benefit).to eq('Newer but inserted sooner by user')
  end
end
