class Api::Auth::SignUpController < ApplicationController
  def create
    user = User.new(sign_up_params)

    if user.save!
      session[:user_id] = user.id
      render json: UserSerializer.render(user), status: :created
    end
  end

  private

  def sign_up_params
    params.expect(user: [ :email, :password, :password_confirmation, :name ])
  end
end
