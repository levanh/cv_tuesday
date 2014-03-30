require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "CV Tuesday" }

  describe "Home page" do

    it "should have the content 'CV Tuesday'" do
      visit '/static_pages/home'
      expect(page).to have_content('CV Tuesday')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title}")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('#{base_title} | Accueil')
    end
  end

  describe "Help page" do

    it "should have the content 'Aide'" do
      visit '/static_pages/help'
      expect(page).to have_content('Aide')
    end

    it "should have the title 'Aide'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Aide")
    end
  end

  describe "About page" do

    it "should have the content 'A Propos'" do
      visit '/static_pages/about'
      expect(page).to have_content('A Propos')
    end

    it "should have the title 'A Propos'" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | A Propos")
    end
  end
end

