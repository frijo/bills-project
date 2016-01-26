# encoding: utf-8
class User < ActiveRecord::Base
	has_secure_password
	
	validates :nick_name, uniqueness:{message: "Este nombre de usuario esta en uso"}
	
	validates :email, uniqueness:{message: "Este email ya se encuentra registrado"}  
  	
  	#validates_confirmation_of :password,:message => "Las contraseñas deben coincidir"
  	validates :password, confirmation:{ message: " Las contraseñas deben coincidir" }
 	
  	validates :first_name, length: { minimum: 4,
    too_short: "El nombre es muy corto, debe contener minimo %{count} letras", maximum: 30,
    too_long: "El nombre es muy largo, el maximo es de  %{count} letras" }
  	
  	


  

end
