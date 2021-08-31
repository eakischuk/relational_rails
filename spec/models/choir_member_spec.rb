require 'rails_helper'

RSpec.describe ChoirMember, type: :model do

  describe "Relationships" do
    it {should belong_to :choir}

  end

  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :active}
    it {should validate_presence_of :voice_type}
  end
end
