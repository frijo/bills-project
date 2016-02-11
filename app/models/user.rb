# encoding: utf-8
class User < ActiveRecord::Base
	#permit encryp the data of the password parameter => gem bcrypt
  has_secure_password
  # permit save the url in the DB => gem paperclip ... also allows move the upload image to public/system/users/profile_photos
  has_attached_file :profile_photo
  
  # Proof if the current user is normal
  def normal_user?
    self.admin ==false
  end
    # Proof if the current user is Admnin
  def admin_user?
    self.admin ==true
  end
  #Validations of the fields of User Create/Update/Delete
  validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\Z/
  validates :nick_name, :email,:first_name,:last_name, :email, presence:{message: "Este campo no puede estar en blanco"}
	validates :nick_name, uniqueness:{message: "Este nombre de usuario esta en uso"}
	validates :email, uniqueness:{message: "Este email ya se encuentra registrado"}  
  validates :password, confirmation:{ message: " Las contraseñas deben coincidir" }
 	validates :first_name, length: { minimum: 4,
    too_short: "El nombre es muy corto, debe contener minimo %{count} letras", maximum: 30,
    too_long: "El nombre es muy largo, el maximo es de  %{count} letras" }
  validates :last_name, length: { minimum: 4,
    too_short: "El apellido es muy corto, debe contener minimo %{count} letras", maximum: 30,
    too_long: "El apellido es muy largo, el maximo es de  %{count} letras" }
  	
  	


  

end
