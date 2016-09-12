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

genres = [
  { genre: 'action-adventure', display_name: 'Action Adventure' },
  { genre: 'all-books', display_name: 'All Books' },
  { genre: 'arts-photography', display_name: 'Arts, Photography' },
  { genre: 'bestsellers', display_name: 'Bestsellers' },
  { genre: 'biographies-memoirs', display_name: 'Biographies, Memoirs' },
  { genre: 'business-economics', display_name: 'Business, Economics' },
  { genre: 'children-s-books', display_name: "Children's Books"},
  { genre: 'comics-graphic-novels', display_name: 'Comics, Graphic Novels' },
  { genre: 'computers-technology', display_name: 'Computers, Technology' },
  { genre: 'cooking', display_name: 'Cooking' },
  { genre: 'crafts-hobbies-home', display_name: 'Crafts, Hobbies (home)' },
  { genre: 'crime', display_name: 'Crime' },
  { genre: 'current-affairs', display_name: 'Current Affairs' },
  { genre: 'education-reference', display_name: 'Education, Reference' },
  { genre: 'erotica', display_name: 'Erotica' },
  { genre: 'fiction', display_name: 'Fiction' },
  { genre: 'gay-lesbian', display_name: 'Gay, Lesbian' },
  { genre: 'health-fitness-dieting', display_name: 'Health, Fitness, Dieting' },
  { genre: 'history', display_name: 'History' },
  { genre: 'horror', display_name: 'Horror' },
  { genre: 'humor-entertainment', display_name: 'Humor, Entertainment' },
  { genre: 'law-philosophy', display_name: 'Law, Philosophy' },
  { genre: 'literature-fiction', display_name: 'Literature, Fiction' },
  { genre: 'mystery-thriller-suspense', display_name: 'Mystery, Thriller, Suspense' },
  { genre: 'nature-wildlife', display_name: 'Nature, Wildlife' },
  { genre: 'non-fiction', display_name: 'Non-Fiction' },
  { genre: 'other', display_name: 'Other' },
  { genre: 'parenting-relationships', display_name: 'Parenting, Relationships' },
  { genre: 'political-social-sciences', display_name: 'Political, Social Sciences' },
  { genre: 'professional-technical', display_name: 'Professional, Technical' },
  { genre: 'religion-spirituality', display_name: 'Religion, Spirituality' },
  { genre: 'romance', display_name: 'Romance' },
  { genre: 'science-fiction-fantasy', display_name: 'Science Fiction, Fantasy' },
  { genre: 'science-math', display_name: 'Science, Math' },
  { genre: 'self-help', display_name: 'Self-Help' },
  { genre: 'sports-outdoors', display_name: 'Sports, Outdoors' },
  { genre: 'travel', display_name: 'Travel' },
  { genre: 'war', display_name: 'War' },
  { genre: 'westerns', display_name: 'Westerns' },
  { genre: 'young-adult', display_name: 'Young Adult'}
]

genres.each do |genre|
  Genre.create(genre: genre[:genre], display_name: genre[:display_name])
end

puts 'Done!'

