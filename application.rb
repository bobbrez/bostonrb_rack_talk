require 'rack'

class Application
  def call(env)
    case env['REQUEST_PATH']
      when '/facts'
        show env
      when '/logout'
        logout env
      else
        not_found env
    end
  end

  private

  def show(env)
    [200, {"Content-Type" => "text/plain"}, ["Cats can rotate their ears 180 degrees each, independently."]]
  end

  def logout(env)
    env['warden'].logout

    [302, {"Content-Type" => "text/plain", 'Location' => '/'}, ["You've been logged out. Redirecting..."]]
  end

  def not_found(env)
    [404, {"Content-Type" => "text/plain"}, ['Not Found']]
  end
end
