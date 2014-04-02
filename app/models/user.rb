class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

  validates :name, presence: { message: "Veuillez entrez un nom" },
									 length: { minimum: 5, maximum: 25,
									 					 too_short: "Votre nom doit comporter au moins 6 caractères" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: {message: "Veuillez entrez un e-mail" },
										format: { with: VALID_EMAIL_REGEX, message: "Votre e-mail est invalide" },
	                  uniqueness: { case_sensitive: false }

	# validates :weight, presence: { message: "" }

	validates :password, presence: { message: "Veuillez entrez un mot de passe" },
											 length: { minimum: 6,
																 too_short: "Votre mot de passe doit comporter au moins 6 caractères" }

	validates :password_confirmation, presence: { message: "Veuillez répétez votre mot de passe" }

	has_secure_password # also validates matching of password and password_confirmation and add an authenticate method
end
