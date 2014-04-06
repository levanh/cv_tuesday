FactoryGirl.define do
  factory :user do
    name   	  						"John Doe"
		birthdate 						"1990-01-01"
		weight                "75"
		ideal_weight          "65"
		height								"175"
		sporty								"t"
    email   							"john@doe.com"
    password 							"foobar"
    password_confirmation "foobar"
  end
end

