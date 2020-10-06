class User < ApplicationRecord
    has_many :events

    before_save { self.email = email.downcase } # Call this callback to downcase all emails before saving (same as self.email = self.email.downcase). Using bang email.downcase!
    validates :name, presence: true, length: { maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_EMAIL_REGEX_NO_CONSECUTIVE_DOTS =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255}, 
                    format: { with: VALID_EMAIL_REGEX_NO_CONSECUTIVE_DOTS  },
                    uniqueness: true
    has_secure_password #bcrypt is needed for this to work. It inspects the user model for password and confirm password attributes
    validates :password, presence: true, length:{ minimum: 6 }
end
