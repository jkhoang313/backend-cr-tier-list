class Auth
  ALGORITHM = 'HS256'

  def self.encrypt(hash)
    JWT.encode(hash, secret_key, ALGORITHM)
  end

  def self.decode(jwt)
    JWT.decode(jwt, secret_key, true, { algorithm: ALGORITHM }).first
  end

  def self.secret_key
    ENV["SECRET_KEY"]
  end
end
