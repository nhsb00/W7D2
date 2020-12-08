class User < ApplicationRecord
    
    validates :email, :seesion_token, uniqueness: true
    validates :email, :password_digest, :seesion_token, presence: true

    after_initialize :ensure_session_token

    def generate_session_token
        SecureRandom.urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = generate_session_token
        self.save!
        self.seesion_token
    end

    def ensure_session_token
        self.seesion_token ||= generate_session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentails(email, password)
        user = User.find_by(email: email)

        return user if user && user.is_password?(password)
        nil
        #user && user.is_password?(password) ? user : nil
    end
end