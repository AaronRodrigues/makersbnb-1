require 'web_helper'

feature "Listing Spaces" do

    scenario "I can name a new Space" do
      new_space
      expect(page).to have_content "Amazingly Romantic Shed"
    end

    scenario "I can describe a new Space" do
      new_space
      expect(page).to have_content "A shed that is romantic to an amazing degree."
    end

end