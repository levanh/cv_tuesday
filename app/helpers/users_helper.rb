module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

	# Returns the age for the given user.
	def age(user)
		today = Date.today
		birthdate = user.birthdate
		age = today.year - birthdate.year
		# Substracts 1 year to age if this year's birthday hasn't happened yet
		age -= 1 if birthdate.strftime("%m%d").to_i > today.strftime("%m%d").to_i
		# Returns age
		age
	end

	# Returns the BMI for the given user.
	def bmi(user)
		w = user.weight
		h = user.height / 100
		bmi = w/(h*h)
		bmi.round(2)
	end
end
