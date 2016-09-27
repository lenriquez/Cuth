require 'openssl'
require 'base64'

module KeyHelper

  def encrypt password
    public_key = OpenSSL::PKey::RSA.new(File.read(ENV["PUBLIC_KEY_PATH"]))
    return Base64.encode64(public_key.public_encrypt(password))
  end

  def decrypt encrypted_password 
    private_key =OpenSSL::PKey::RSA.new(
      File.read(ENV["PRIVATE_KEY_PATH"]),pass_phrase)

    return private_key.private_decrypt(Base64.decode64(encrypted_password))
  end
end