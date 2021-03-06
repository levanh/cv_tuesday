require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('CV Tuesday') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Accueil') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Aide') }
    it { should have_title(full_title('Aide')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('À Propos') }
    it { should have_title(full_title('À Propos')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
end
