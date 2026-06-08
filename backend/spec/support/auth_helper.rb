module AuthHelper
  def login(user, password: "password")
    post api_auth_login_path, params: {
      user: {
        email: user.email,
        password:,
      }
    }
  end
end