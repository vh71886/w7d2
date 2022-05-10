class User < ApplicationRecord
    attr_reader :password

    validates :email, :password_digest, :session_token, presence: true
    validates :email, :session_token, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true
    before_validation :ensure_session_token

    # Create session
    def self.generate_session_token
        self.session_token = SecureRandom::urlsafe_base64
    end

    # Find user by email and password combination
    def self.find_by_credentials(email, password)
        @user = User.find_by(
            params[:user][:email],
            params[:user][:password]
        )

        if @user.nil?
            nil
        else
            @user
        end
    end

    # Set password and password_digest
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    # Verify login password with username
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end 

    # Reset it
    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    # Prevent session_token = nil
    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end
