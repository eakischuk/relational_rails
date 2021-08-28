require 'rails_helper'

RSpec.describe GymMember do
  it {should belong_to :climbing_gym}
end
