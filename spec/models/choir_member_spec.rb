require 'rails_helper'

RSpec.describe ChoirMember, type: :model do
  it {should belong_to :choir}
end
