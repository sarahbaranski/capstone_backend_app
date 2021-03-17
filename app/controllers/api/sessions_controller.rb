class Api::SessionsController < ApplicationController
  def create
    student = Student.find_by(email: params[:email])
    if student && student.authenticate(params[:password])
      jwt = JWT.encode(
        {
          student_id: student.id, # the data to encode
          exp: 300.days.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      render json: { jwt: jwt, email: student.email, student_id: student.id }, status: :created
    else
      supervisor = Supervisor.find_by(email: params[:email])
      if supervisor && supervisor.authenticate(params[:password])
        jwt = JWT.encode(
          {
            supervisor_id: supervisor.id, # the data to encode
            exp: 300.days.from_now.to_i, # the expiration time
          },
          Rails.application.credentials.fetch(:secret_key_base), # the secret key
          "HS256" # the encryption algorithm
        )
        render json: { jwt: jwt, email: supervisor.email, supervisor_id: supervisor.id }, status: :created
      else
        render json: {}, status: :unauthorized
      end
    end
  end
end
