module SessionHelper
  # Read key from cookies
  def apply_cookie_key!
    session[:door_key] = cookies[:door_key] if cookies[:door_key]
  end

  # Verify if the provided door_key is valid, and set to cookie
  def verify!(door_key)
    return false unless door_key == Rails.configuration.door_key

    session[:door_key] = door_key
    cookies[:door_key] = {
      value: door_key,
      expires: 30.days.from_now,
      secure: false,
      httponly: false
    }
  end

  # check if the session[:door_key] is set
  def verified?
    session[:door_key].present? && session[:door_key] == cookies[:door_key]
  end
end
