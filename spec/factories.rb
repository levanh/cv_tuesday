FactoryGirl.define do
  factory :user do
    name   	  						"John Doe"
		birthdate 						"1990-01-01"
		weight                "75"
		ideal_weight          "65"   
    email   							"johndoe@example.com"
    password 							"foobar"
    password_confirmation "foobar"
  end
end

