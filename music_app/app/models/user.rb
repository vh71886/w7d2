class User < ApplicationRecord
    validates :email, :password_digest, :session_token, presence: true
    validatess :email, uniqueness: true

    # Create session
    def self.generate_session_token

    end

    # Find user by email and password combination
    def find_by_credentials(email, password)

    end

    # Set password and password_digest
    def password=(password)

    end

    # Verify login password with username
    def is_password?(password)

    end

    # Reset it
    def reset_session_token!

    end

    # Prevent session_token = nil
    def ensure_session_token

    end
end
