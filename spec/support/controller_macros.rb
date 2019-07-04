module ControllerMacros
  def login_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user_confirmed]
    sign_in user
  end
end
