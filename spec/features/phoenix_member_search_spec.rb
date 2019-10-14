# As a user,
# When I visit "/"
# And I Select "Griffindor" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see a total of the number of members for that house. (18 for Griffindor)
# Then I should see a list of 18 members
#
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)
require 'rails_helper'

describe 'Order of the Phoenix Member Search' do
  describe 'when a user visits / and selects Gryffindor' do
    it 'can click search button and see all members of both Gryffindor and Order of the Phoenix'do
      visit '/'

      click_button 'Search For Members'

      expect(current_path).to eq('/search')
      expect(page).to have_content('21 members')

      within(first('.member')) do
        expect(page).to have_content('Sirius Black')
        expect(page).to have_content('Gryffindor')
      end

      # within('.member') do
        expect(page).to have_content('Ronald Weasley')
        expect(page).to have_content('Gryffindor')
        expect(page).to have_content('student')
        expect(page).to have_content('jack russell terrier')
      # end
    end
  end
end
