require 'rails_helper'

RSpec.describe "Api::Auth::Sessions", type: :request do
  describe "POST /api/auth/login" do
    subject { post api_auth_login_path, params: }

    let!(:user) { create(:user, password: "password") }
    let(:params) do
      {
        user: {
          email: user.email,
          password: "password"
        }
      }
    end

    context "パラメーターが有効な場合" do
      it "sessionを設定し、200を返すこと" do
        subject
        expect(response).to have_http_status(:ok)
        expect(session[:user_id]).to eq(user.id)
      end
    end
  end
end
