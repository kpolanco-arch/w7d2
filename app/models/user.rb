# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#
class User < ApplicationRecord
     validates :email, presence :true, unique: true
     validates :session_token, presence :true, unique: true
     validates :password_digest, presence :true
     validates :password, allow_nil: true, length: {minimum: 6}
    
     before_validation :ensure_session_token
     attr_accessor :password

     def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            user
        else
            nil
        end

     end

     def password=(password)

       self.password_digest = BCrypt::Password.create(password)
       @password = password

     end

     def is_password?(password)
        bcrypt_object = BCrypt::Password.new(password_digest)
        bcrypt_object.is_password?(password)

     end

     def reset_session_token!
      self.session_token = SecureRandom::url_safe_base64
      self.save!
      self.session_token
     end

     def ensure_session_token
        self.session_token ||= SecureRandom::url_safe_base64
     end











end
