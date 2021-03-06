# frozen_string_literal: true

describe HomeController, type: :controller do
  describe 'GET #index' do
    before { get :index }
    it 'assigns variables' do
      expect(assigns(:slider_items)).not_to be_nil
      expect(assigns(:best_sellers)).not_to be_nil
    end

    it 'renders :index template' do
      expect(response).to render_template(:index)
    end

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end
  end
end
