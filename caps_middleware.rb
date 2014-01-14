class CapsMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    response = @app.call env

    response[2] = [ response[2][0].to_s.upcase ]

    response
  end
end
