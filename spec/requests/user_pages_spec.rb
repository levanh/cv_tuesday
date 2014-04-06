require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Inscription') }
    it { should have_title(full_title('Inscription')) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Créer mon profil" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Nom",        				with: "John Doe"
				select  "1",        				  from: "user_birthdate_3i"
				select  "Janvier",        		from: "user_birthdate_2i"
				select  "1990",        				from: "user_birthdate_1i"
				fill_in "Poids actuel",				with: "75"
				fill_in "Poids idéal",				with: "65"
				fill_in "Taille",							with: "175"
        fill_in "E-mail", 						with: "john@doe.com"
        fill_in "Mot de passe",  			with: "foobar"
        fill_in "Confirmation", 			with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
