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
        expect(response.parsed_body).to eq({
                                             "id" => user.id,
                                             "email" => user.email,
                                             "name" => user.name
                                           })
      end
    end
  end

  describe "DELETE /api/auth/logout" do
    subject { delete api_auth_logout_path }

    let(:user) { create(:user, password: "password") }

    before do
      login(user)
    end

    it "sessionを削除し、204を返すこと" do
      expect(session[:user_id]).to eq(user.id)
      subject
      expect(response).to have_http_status(:no_content)
      expect(session[:user_id]).to be_nil
    end
  end
end
