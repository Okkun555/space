module ErrorHandler
  extend ActiveSupport::Concern

  included do
    # [注意] 下に行くほど優先度高なので要注意
    rescue_from StandardError, with: :render_internal_server_error
    rescue_from ActiveRecord::RecordInvalid, with: :rescue_record_invalid
  end


  # 401 unauthorized error
  def render_unauthorized(message: "認証が必要です")
    render_base_error(message:, code: :unauthorized)
  end

  # 403 forbidden error
  def rescue_forbidden
    render_base_error(message: "この操作を行う権限がありません", code: :forbidden)
  end

  # 409 conflict error
  def render_conflict(message:)
    render_base_error(message: message, code: :conflict)
  end

  # 422 validation error
  def render_record_invalid(exception)
    render json: {
      errors: exception.record.errors.map do |error|
        {
          field: error.attribute.to_s,
          message: error.message
        }
      end
    }, status: :unprocessable_entity
  end

  def render_internal_server_error(exception)
    render json: {
      errors: [
        { field: "base", message: "予期せぬエラーが発生しました" }
      ]
    }, status: :internal_server_error
  end

  private

  def render_base_error(message:, code:)
    render json: {
      errors: [
        { field: "base", message: }
      ]
    }, status: code
  end
end