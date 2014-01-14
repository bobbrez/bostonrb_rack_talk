require 'rotp'

Warden::Strategies.add(:otp) do

  SECRET = 'b5kwdwbppazvy6qq'

  def valid?
    true
  end

  def authenticate!
    totp = ROTP::TOTP.new SECRET

    user = OpenStruct.new name: params['name']

    params['otp'] == totp.now.to_s ? success!(user) : fail!('OTP does not match')
  end
end
