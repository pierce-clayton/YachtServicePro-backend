# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Marina.create!(name: 'Oak Harbor', address_line_1: '1401 SE Catalina Dr', address_line_2: '', city: 'Oak Harbor', state:'WA', zip: 98277, description: 'city marina')
Marina.create!(name: 'Anchor Cove Marina', address_line_1: '1600 5th St', address_line_2: '', city: 'Anacortes', state:'WA', zip: 98221, description: 'city marina')
Marina.create!(name: 'Fidalgo Marina', address_line_1: '3101 V Pl', address_line_2: '', city: 'Anacortes', state:'WA', zip: 98221, description: 'city marina')
Marina.create!(name: 'Skyline Marine Center', address_line_1: '2011 Skyline Way', address_line_2: '', city: 'Anacortes', state:'WA', zip: 98221, description: 'city marina')
Marina.create!(name: 'Port of South Whidbey Harbor at Langley', address_line_1: '228 Wharf St', address_line_2: '', city: 'Langley', state:'WA', zip: 98260, description: 'city marina')
