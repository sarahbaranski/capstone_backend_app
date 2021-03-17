class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: -> { request.format.html? }

  def current_student
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
        Student.find_by(id: decoded_token[0]["student_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_student

  def current_supervisor
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
        Supervisor.find_by(id: decoded_token[0]["supervisor_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_supervisor

  def authenticate_student
    unless current_student
      render json: {}, status: :unauthorized
    end
  end
end
