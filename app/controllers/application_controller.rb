class ApplicationController < ActionController::Base
  SECRET_SALT = 'supersecretkey'

  before_action :authorized

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def encode_token(payload)
    JWT.encode(payload, SECRET_SALT, 'HS256')
  end

  def decoded_token
    header = request.headers['X-Auth-Token']
    if header
      token = header.split(" ")[1]
      #render json: token
      begin
        JWT.decode(header, SECRET_SALT, true, { algorithm: 'HS256' }) #changed token to header
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_student
    if decoded_token
      student_id = decoded_token[0]['student_id']
      @student = Student.find_by id: student_id
    end
  end

  def authorized
    unless !!current_student
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end
end
