require 'rails_helper'

RSpec.describe Choir, type: :model do
  it {should have_many :choir_members}
end
