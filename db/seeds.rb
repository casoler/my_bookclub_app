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
  {genre: 'Classic', description: 'fiction that has become part of an accepted literary canon, widely taught in schools'},
  {genre: 'Crime/detective', description: 'fiction about a crime, how the criminal gets caught, and the repercussions of the crime'},
  {genre: 'Drama', description: 'stories composed in verse or prose, usually for theatrical performance, where conflicts and emotion are expressed through dialogue and action'},
  {genre: 'Fable', description: 'narration demonstrating a useful truth, especially in which animals speak as humans; legendary, supernatural tale'},
  {genre: 'Fairy Tale', description: 'story about fairies or other magical creatures'},
  {genre: 'Fanfiction', description: 'fiction written by a fan of, and featuring characters from, a particular TV series, movie, etc.'},
  {genre: 'Fantasy', description: 'fiction with strange or otherworldly settings or characters; fiction which invites suspension of reality'},
  {genre: 'Fiction in Verse', description: 'full-length novels with plot, subplot(s), theme(s), major and minor characters, in which the narrative is presented in verse form (usually free verse)'},
  {genre: 'Fiction Narrative', description: 'literary works whose content is produced by the imagination and is not necessarily based on fact'},
  {genre: 'Folklore', description: 'the songs, stories, myths, and proverbs of a people or "folk" as handed down by word of mouth'},
  {genre: 'Historical Fiction', description: 'story with fictional characters and events in a historical setting'},
  {genre: 'Horror', description: 'fiction in which events evoke a feeling of dread and sometimes fear in both the characters and the reader'},
  {genre: 'Humour', description: 'Usually a fiction full of fun, fancy, and excitement, meant to entertain and sometimes cause intended laughter; but can be contained in all genres'},
  {genre: 'Legend', description: 'story, sometimes of a national or folk hero, that has a basis in fact but also includes imaginative material'},
  {genre: 'Magical Realism', description: 'story where magical or unreal elements play a natural part in an otherwise realistic environment'},
  {genre: 'Metafiction', description: 'also known as romantic irony in the context of Romantic works of literature, uses self-reference to draw attention to itself as a work of art, while exposing the "truth" of a story'},
  {genre: 'Mystery', description: 'this is fiction dealing with the solution of a crime or the unraveling of secrets'},
  {genre: 'Mythology', description: 'legend or traditional narrative, often based in part on historical events, that reveals human behavior and natural phenomena by its symbolism; often pertaining to the actions of the gods'},
  {genre: 'Mythopoeia', description: 'fiction in which characters from religious mythology, traditional myths, folklores and history are recast into a re-imagined realm created by the author'},
  {genre: 'Picture Story', description: 'picture story is a book with very little words and alot of pictures, picture story is usally for little kids'},
  {genre: 'Realistic Fiction', description: 'story that is true to life'},
  {genre: 'Science Fiction', description: 'story based on impact of actual, imagined, or potential science, usually set in the future or on other planets'},
  {genre: 'Short Story', description: 'fiction of such brevity that it supports no subplots'},
  {genre: 'Suspense/Thriller', description: 'fiction about harm about to befall a person or group and the attempts made to evade the harm'},
  {genre: 'Tall Tale', description: 'humorous story with blatant exaggerations, swaggering heroes who do the impossible with nonchalance'},
  {genre: 'Western', description: 'set in the American Old West frontier and typically set in the late eighteenth to late nineteenth century'}
]

genres.each do |genre|
  Genre.create(genre: genre[:genre], description: genre[:description])
end

puts 'Done!'
