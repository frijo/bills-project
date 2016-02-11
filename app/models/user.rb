# encoding: utf-8
class User < ActiveRecord::Base
	has_secure_password
  has_attached_file :profile_photo
  
  def normal_user?
    self.admin ==false
  end
  def admin_user?
    self.admin ==true
  end




  validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\Z/


	validates :nick_name, :email,:first_name,:last_name, :email, presence:{message: "Este campo no puede estar en blanco"}
	validates :nick_name, uniqueness:{message: "Este nombre de usuario esta en uso"}
	
	validates :email, uniqueness:{message: "Este email ya se encuentra registrado"}  
  	
 #	validates_confirmation_of :password,:message => "Las contraseñas deben coincidir"
  	validates :password, confirmation:{ message: " Las contraseñas deben coincidir" }
 	
  	validates :first_name, length: { minimum: 4,
    too_short: "El nombre es muy corto, debe contener minimo %{count} letras", maximum: 30,
    too_long: "El nombre es muy largo, el maximo es de  %{count} letras" }

    validates :last_name, length: { minimum: 4,
    too_short: "El apellido es muy corto, debe contener minimo %{count} letras", maximum: 30,
    too_long: "El apellido es muy largo, el maximo es de  %{count} letras" }
  	
  	


  

end
