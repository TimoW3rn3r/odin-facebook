# Delete all records
User.delete_all
Post.delete_all

5.times do
  User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.full_address,
      email: Faker::Internet.email,
      password: 'password'
  )
end

lorems = [
  "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Architecto veritatis ullam tenetur! Ad beatae tempore ab porro earum laboriosam distinctio. Ducimus quia perferendis fugiat ab ipsa sunt cupiditate expedita praesentium!",
  "Obcaecati esse illum dolores amet excepturi maxime praesentium beatae ipsa, aperiam delectus nostrum dolor facilis sint at accusantium nisi architecto debitis labore laborum tempora soluta est magnam aut! Esse, nisi!",
  "Tempora alias temporibus nemo atque molestias sequi ipsum maxime accusantium perferendis adipisci asperiores amet id culpa delectus dolorum, exercitationem laborum suscipit cumque est tempore fugit? Numquam ea vel fugit quae?",
  "Facilis vero fugit vitae? Nobis exercitationem cumque quas deleniti, rerum quidem iusto autem numquam omnis, magnam vitae blanditiis maxime quos laboriosam vel quo praesentium, laudantium quae asperiores fugit dolorem! Cupiditate.",
  "Dicta quod ea excepturi molestiae debitis dolores, aspernatur iusto officiis velit. Corporis, ad, error repellendus nostrum voluptate atque tempora esse porro blanditiis aliquid eum aliquam non dolor. Voluptas, quasi eligendi!",
]

user_ids = User.ids

5.times do |i|
  Post.create!(
    body: lorems[i],
    user_id: user_ids.sample
  )
end
