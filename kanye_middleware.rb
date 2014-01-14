class KanyeMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    response = @app.call env

    new_text = [ "I'ma let you finish, but #{response[2][0]}" ]

    case response[1]['Content-Type']
    when /^text\//
      response[2] = new_text
    end

    response
  end
end

