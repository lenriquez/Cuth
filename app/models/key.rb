class Key
  include Mongoid::Document
  field :title, type: String
  field :name, type: String
  field :url, type: String
  field :password, type: String
  field :comments, type: String

  def password
    private_key = OpenSSL::PKey::RSA.new(
      File.read(ENV["PRIVATE_KEY_PATH"]), ENV["PASS_PHRASE"])

    return private_key.private_decrypt(Base64.decode64(self[:password]))
  end

  def password=(password)
    public_key = OpenSSL::PKey::RSA.new(File.read(ENV["PUBLIC_KEY_PATH"]))
    self[:password] = Base64.encode64(public_key.public_encrypt(password))
  end
end
