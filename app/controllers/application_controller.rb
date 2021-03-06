class ApplicationController < ActionController::API
  def issue_token(payload)
    JWT.encode(payload, 'SECRET')
  end

  def decode_token
    JWT.decode(get_token, 'SECRET')[0]
  end

  def get_token
    request.authorization
  end

  def currentt_user
    User.find_by(decode_token["user_id"])

  end

  def logged_in
    !!currentt_user
  end

end
