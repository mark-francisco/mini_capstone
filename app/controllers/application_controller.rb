class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  protect_from_forgery with: :exception, if: -> { request.format.html? }

  def current_user
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      render json: {:message => "you must be logged in as a User to do that."}, status: :unauthorized
    end
  end

  def authenticate_admin
    # if a user is logged in, current_user gets set as a single User instance.
    unless current_user && current_user.admin
      render json: {:message => "you must be logged in as a User and be an admin to do that."}, status: :unauthorized
    end
  end

end
