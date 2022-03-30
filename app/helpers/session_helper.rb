module SessionHelper
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

  def verified?
    session[:door_key].present? && session[:door_key] == cookies[:door_key]
  end
end
