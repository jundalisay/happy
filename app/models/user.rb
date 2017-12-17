class User < ActiveRecord::Base
  attr_accessor :remember_token, :reset_token
  # before_save   :downcase_email
  before_create :generate_access_token

  recommends :songs, :artists, :genres

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true


  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  include PgSearch
    pg_search_scope :search, against: [:name, :username, :first_name, :last_name, :email, :status, :about], 
    using: {tsearch: {dictionary: "english"}}


  private

    def generate_access_token
      begin
        self.access_token = User.new_token
      end while self.class.exists?(access_token: access_token)
    end
end