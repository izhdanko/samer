task default: 'samer:release'

namespace :samer do

  task :build do
    sh "gem build samer.gemspec"
  end

  task :install do
    pkg = Dir['*.gem'].last
    sh "gem install ./#{pkg}"
  end

  task release: [:build, :install]

end
