require 'rails_helper'

RSpec.describe Choir, type: :model do
  before(:each) do
    @divo = Choir.create!(name: "Divo", openings: 2, active: true)
    @volcestra = Choir.create!(name: "Volcestra", openings: 1, active: true)
    @lucy = ChoirMember.create!(choir: @divo, name: "Lucy Perez", age: 34, active: true, voice_type: "Soprano")
    @respi = ChoirMember.create!(choir: @volcestra, name: "Respi Luz", age: 28, active: true, voice_type: "Alto")
  end
  it {should have_many :choir_members}

  describe 'class methods' do
    it 'orders elements by creation date' do
      choirs = Choir.order_by_creation
      expect(choirs).to eq([@volcestra, @divo])
    end
  end

  describe 'instance methods' do
    it 'counts members' do
      expect(@divo.member_count).to eq(1)
      expect(@volcestra.member_count).to eq(1)
    end
  end

  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :openings}
    it {should validate_presence_of :active}
  end
end
