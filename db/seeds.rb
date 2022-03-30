category = Category.find_or_create_by(name: 'Ruby')

Article.find_or_create_by(title: 'Ruby',
                          content: 'Ruby is a dynamic, reflective,
                          object-oriented, general-purpose programming language.
                          It was designed and developed in the mid-1990s by Yukihiro "Matz" Matsumoto in Japan.
                          The language itself was designed for programmers, but is now used for system administration,
                          software testing, and application development.',
                          category: category)

Article.find_or_create_by(title: 'Ruby on Rails',
                          content: 'Ruby on Rails is a server-side web application framework written in Ruby under
                           the MIT License.',
                          category: category)

puts 'Seeding finished'
