require 'json'

class JSONMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    return @app.call env unless env['REQUEST_PATH'] =~ /\.json$/

    env['REQUEST_PATH'] = env['REQUEST_PATH'].gsub(/\.json$/, '')
    response = @app.call env

    response[2] = [ { fact: response[2][0]}.to_json ]

    response
  end
end
