class User < ActiveRecord::Base
	mount_uploader :cv, CvUploader
	before_save { self.email = email.downcase }

  validates :name, presence: true,
									 length: { minimum: 6, maximum: 25,
									 					 too_short: "Votre nom doit comporter au moins 6 caractères" },
									 uniqueness: { case_sensitive: false }

	validates :birthdate, presence: { message: "Veuillez renseigner votre date de naissance complète " }

	validates_numericality_of :weight, message: "Veuillez entrer un poids valide (numérique)"
	validates_inclusion_of :weight, in: 40..99

	validates_numericality_of :ideal_weight, message: "Veuillez entrer un poids idéal valide (numérique)",
																		       less_than: :weight
																					
	validates_numericality_of :height, message: "Veuillez entrer une taille valide"
	validates_inclusion_of :height, in: 140..200

	validates_inclusion_of :sporty, :in => [true, false]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
										format: { with: VALID_EMAIL_REGEX, message: "Veuillez entrer un e-mail valide" },
	                  uniqueness: { case_sensitive: false }

	validates :password, presence: true,
											 length: { minimum: 6,
																 too_short: "Veuillez entrer un mot de passe valide (au moins 6 caractères)"  }

	validates_confirmation_of :password, message: "Veuillez répéter votre mot de passe"

	has_secure_password # also validates matching of password and password_confirmation and add an authenticate method
end
