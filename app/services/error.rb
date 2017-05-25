class Error < Response
  attr_reader :errors, :status

  def initialize(errors, http_code = :bad_request)
    @errors = errors.is_a?(Array) ? errors : [errors]
    @status = http_code
  end

  def success?
    false
  end
end