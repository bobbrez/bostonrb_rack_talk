require 'rack'

class Failure
  def call(env)
    [500, {"Content-Type" => "text/html"}, ['<html><body><h1>Login</h1><form method="get">OTP: <input type="text" name="otp" /><br />Name: <input type="name" name="name"/><input type="submit" value="Login"></form></body></html>']]
  end
end

