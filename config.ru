require 'rack'
require 'warden'
require 'byebug'

require './application'
require './failure'
require './otp_strategy'
require './caps_middleware'
require './kanye_middleware'
require './json_middleware'

use Rack::Session::Cookie, secret: 'jn23k4j5n23k4tlk;23m45l;km2435'

use JSONMiddleware
use KanyeMiddleware
use CapsMiddleware

run Application.new
