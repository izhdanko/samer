Gem::Specification.new do |s|
  s.name        = 'samer'
  s.version     = '1.0.0'
  s.date        = '2023-01-14'
  s.summary     = 'Find someone like you.'
  s.description = 'A simple gem that finds similar persons by comparing their music ratings.'
  s.authors     = ['Ivan Zhdanko']
  s.email       = 'izh-programmist@yandex.ru'

  s.homepage    = 'https://github.com/izhdanko/samer'
  s.license     = 'MIT'

  s.files       = %w{
    lib/samer.rb
    lib/samer/data_provider.rb
    lib/samer/engine.rb
    lib/samer/user.rb
    lib/samer/similar_user.rb
  }
  s.files      += Dir['lib/data/*']

  s.executables.push 'samer'
end
