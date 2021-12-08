require 'faker'
require 'activerecord-reset-pk-sequence'

User.destroy_all
List.destroy_all
Item.destroy_all
Category.destroy_all
User.reset_pk_sequence
List.reset_pk_sequence
Item.reset_pk_sequence
Category.reset_pk_sequence

puts '🌱 Seeding spices...'

puts 'User...'

num_categories = 4

u1 =
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
  )

puts 'Lists...'

2.times { List.create(user_id: u1.id, name: Faker::Hobby.activity) }

puts 'Items...'

10.times do
  List.all.each do |l|
    ingredient = Faker::Food.ingredient
    Item.create(
      name: ingredient,
      category_id: rand(1..num_categories),
      list_id: l.id,
      quantity: rand(1..25),
      min_quantity: rand(1..25),
      notes: Faker::Food.description,
      image: Faker::LoremFlickr.image(search_terms: [ingredient]),
    )
  end
end

puts 'Category...'

num_categories.times { Category.create(name: Faker::Food.ethnic_category) }

puts '✅ Done seeding!'
