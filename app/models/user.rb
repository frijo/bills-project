class User < ActiveRecord::Base
	has_secure_password

  validates_confirmation_of :nick_name, :password
    validates_confirmation_of :email,
                              message: 'should match confirmation'
end
