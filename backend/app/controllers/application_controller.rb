class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include ErrorHandler

  protect_from_forgery with: :null_session

  private

  # TODO: ログインチェック、ログインユーザー取得メソッドを記載
end
