User.destroy_all
Group.destroy_all
Member.destroy_all
Book.destroy_all
PastBook.destroy_all

users = [{ first_name: 'Bob', last_name: 'Smith', zip_code: 60001 },
         { first_name: 'Ted', last_name: 'Jones', zip_code: 60002 },
         { first_name: 'Carol', last_name: 'Brown', zip_code: 60002 },
         { first_name: 'Alice', last_name: 'Soler', zip_code: 60004 }]

users.each do |user|
  User.create(
    first_name: user[:first_name],
    last_name: user[:last_name],
    email: "#{user[:first_name]}@#{user[:first_name]}.com",
    password: 'password',
    zip_code: user[:zip_code]
  )
end

groups = ['Happy Readers', 'Books are Fun', 'Friday Night Books']
  
groups.each do |group|
  Group.create(name: group)
end

users = User.all
groups = Group.all

groups.each do |group|
  users.each do |user|
    Member.create(user_id: user.id, group_id: group.id)
  end
end

books = [{ title: 'The Girl on the Train', author: 'Hawkins', isbn: '978-0857523921' },
         { title: 'Why Not Me?', author: 'Kaling', isbn: '978-0804138147' },
         { title: 'Between the World and Me', author: 'Coates', isbn: '978-0812993547' },
         { title: 'The Food Lab: Better Home Cooking Through Science', author: 'Lopez-Alt', isbn: '978-0393081084' }]

books.each do |book|
  Book.create(title: book[:title], author: book[:author], isbn: book[:isbn])
end

books = Book.all

groups.each do |group|
  books.each do |book|
    PastBook.create(group_id: group.id, book_id: book.id)
  end
end

puts 'Done!'
