require 'rails_helper'

RSpec.describe 'Cimbing Gym index' do

  visit "/climbing_gyms"

  expect(page).to have_content()
# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

end
