# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
GymMember.destroy_all
ClimbingGym.destroy_all

et = ClimbingGym.create!(name: "EarthTreks", ropes: true, total_routes: 200)
movement = ClimbingGym.create!(name: "Movement RiNo", ropes: false, total_routes: 70)

et.gym_members.create!(first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
et.gym_members.create!(first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
movement.gym_members.create!(first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)
# @amy = GymMember.create!(climbing_gym: @et, first_name: "Amy", last_name: "Santiago", belay_status: true, monthly_checkins: 12)
# @jake = GymMember.create!(climbing_gym: @et, first_name: "Jake", last_name: "Peralta", belay_status: false, monthly_checkins: 3)
# @rosa = GymMember.create!(climbing_gym: @movement, first_name: "Rosa", last_name: "Diaz", belay_status: true, monthly_checkins: 14)



# Choir.destroy_all
# ChoirMember.destroy_all
#
# divo = Choir.create!(name: "Divo", openings: 1, active: true)
# volcestra = Choir.create!(name: "Volcestra", openings: 2, active: true)
#
# divo.choir_members.create!(name: "Lucy Perez", age: 34, active: true, voice_type: "Soprano")
# divo.choir_members.create!(name: "Sam River", age: 24, active: true, voice_type: "Alto")
# volcestra.choir_members.create!(name: "Respi Luz", age: 28, active: true, voice_type: "Alto")
Choir.destroy_all
ChoirMember.destroy_all

divo = Choir.create!(name: "Divo", openings: 1, active: true)
volcestra = Choir.create!(name: "Volcestra", openings: 2, active: true)

divo.choir_members.create!(name: "Lucy Perez", age: 34, active: true, voice_type: "Soprano")
divo.choir_members.create!(name: "Sam River", age: 24, active: true, voice_type: "Alto")
volcestra.choir_members.create!(name: "Respi Luz", age: 28, active: true, voice_type: "Alto")
