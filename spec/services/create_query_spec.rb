require 'rails_helper'

RSpec.describe CreateQuery do
  before(:each) do
    @user = create(:user)
  end

  context 'creates query' do
    before(:each) do
      expect(InitialSearch).to receive(:call).and_return(nil)
      @params = { case: '1',
                  province: '01',
                  locality: 'Wrocław',
                  benefit: 'Alergolog' }
    end

    it 'with received params' do
      CreateQuery.call(@params, @user.id)

      expect(Query.first.case).to eq(@params[:case].to_i)
      expect(Query.first.province).to eq(@params[:province])
      expect(Query.first.locality).to eq(@params[:locality])
      expect(Query.first.benefit).to eq(@params[:benefit])
    end

    it 'assigned to user' do
      query = CreateQuery.call(@params, @user.id)

      expect(@user.queries.first).to eq(query)
    end

    it 'with capitalized attrs' do
      params = { case: @params[:case],
                 province: @params[:province].downcase,
                 locality: @params[:locality].downcase,
                 benefit: @params[:benefit].downcase }
      CreateQuery.call(@params, @user.id)

      expect(Query.first.case).to eq(@params[:case].to_i)
      expect(Query.first.province).to eq(@params[:province])
      expect(Query.first.locality).to eq(@params[:locality])
      expect(Query.first.benefit).to eq(@params[:benefit])
    end
  end

  context 'with existing query' do
    it 'does not create new query' do
      old_query = create :query
      params = { case: old_query.case.to_s,
                 province: old_query.province,
                 locality: old_query.locality,
                 benefit: old_query.benefit }
      CreateQuery.call(params, @user.id)

      expect(Query.count).to eq 1
    end

    it 'does not create new user_query' do
      old_query = create :query
      UserQuery.create(user_id: @user.id, query_id: old_query.id)
      params = { case: old_query.case.to_s,
                 province: old_query.province,
                 locality: old_query.locality,
                 benefit: old_query.benefit }
      CreateQuery.call(params, @user.id)

      expect(UserQuery.count).to eq 1
    end
  end
end
