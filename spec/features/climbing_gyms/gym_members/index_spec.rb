require 'rails_helper'

RSpec.describe 'Climbing Gym members index' do
  before(:each) do
    @et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
    @movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)
    @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
    @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
    @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
  end

  it 'shows all member names for the gym' do
    visit "/climbing_gyms/#{@et.id}/gym_members"

    expect(page).to have_content(@amy.full_name)
    expect(page).to have_content(@jake.full_name)

    visit "/climbing_gyms/#{@movement.id}/gym_members"

    expect(page).to have_content(@rosa.full_name)
    expect(page).to_not have_content(@amy.full_name)
    expect(page).to_not have_content(@jake.full_name)
  end

  it 'shows all members belay status' do
    visit "/climbing_gyms/#{@et.id}/gym_members"
    expect(page).to have_content("Belay Certified: #{@amy.belay_status}")
    expect(page).to have_content("Belay Certified: #{@jake.belay_status}")

    visit "/climbing_gyms/#{@movement.id}/gym_members"
    expect(page).to have_content("Belay Certified: #{@rosa.belay_status}")
    expect(page).to_not have_content("Belay Certified: false")
  end

  it 'shows all members monthly check in' do
    visit "/climbing_gyms/#{@et.id}/gym_members"
    expect(page).to have_content("Monthly Check-ins: #{@amy.monthly_checkins}")
    expect(page).to have_content("Monthly Check-ins: #{@jake.monthly_checkins}")

    visit "/climbing_gyms/#{@movement.id}/gym_members"
    expect(page).to have_content("Monthly Check-ins: #{@rosa.monthly_checkins}")
    expect(page).to_not have_content("Monthly Check-ins: #{@amy.monthly_checkins}")
    expect(page).to_not have_content("Monthly Check-ins: #{@jake.monthly_checkins}")
  end

  it 'has all members link' do
    visit "/climbing_gyms/#{@et.id}/gym_members"

    click_on 'All Gym Members'
    expect(current_path).to eq('/gym_members')
  end

  it 'has all gyms link' do
    visit "/climbing_gyms/#{@et.id}/gym_members"

    click_on 'Climbing Gyms'
    expect(current_path).to eq('/climbing_gyms')
  end

  it 'has alphabetical order' do
    visit "/climbing_gyms/#{@et.id}/gym_members"

    click_on 'Order Members'
    expect(current_path).to eq("/climbing_gyms/#{@et.id}/gym_members")
    expect("Amy Santiago").to appear_before("Jake Peralta")
    expect("Monthly Check-ins: 12").to appear_before("Monthly Check-ins: 3")
    expect("Belay Certified: true").to appear_before("Belay Certified: false")
  end

  it 'limits records of page by monthly checkins using form input' do
    visit "/climbing_gyms/#{@et.id}/gym_members"

    fill_in('Minimum Check-ins:', with: 5)
    click_on "Only return members with more than minimum monthly checkins"
    expect(current_path).to eq("/climbing_gyms/#{@et.id}/gym_members")
    expect(page).to have_content("Amy Santiago")
    expect(page).to_not have_content("Jake Peralta")
    expect(page).to_not have_content("Rosa Diaz")
  end

  it 'has delete button for each member' do
    visit "/climbing_gyms/#{@et.id}/gym_members"

    expect(page).to have_button("Delete Amy Santiago")
    expect(page).to have_button("Delete Jake Peralta")
    expect(page).to_not have_button("Delete Rosa Diaz")

    click_on "Delete Jake Peralta"
    expect(current_path).to eq("/gym_members")
    expect(page).to have_content("Amy Santiago")
    expect(page).to_not have_content("Jake Peralta")
  end
end
