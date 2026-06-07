require "rails_helper"

RSpec.describe "Api::Auth::SignUp", type: :request do
  describe "POST /api/auth/sign_up" do
    subject { post "/api/auth/sign_up", params: }

    let(:params) do
      {
        user: {
          email: "test@email.com",
          password: "password123",
          password_confirmation: "password123",
          name: "ユーザー1"
        }
      }
    end

    context "パラメータが有効な場合" do
      it "ユーザーが作成され、201を返すこと" do
        expect { subject }.to change(User, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context "パラメータが無効な場合" do
      context "既にアカウント作成済みのメールアドレスの場合" do
        before do
          create(:user, email: params[:user][:email])
        end

        it "ユーザーを作成せず、422を返すこと" do
          expect { subject }.to change(User, :count).by(0)
          expect(response). to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
