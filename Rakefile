require 'fileutils'

task :default => :build

desc 'Build the site'
task :build do
  rake_running
  jekyll('build' + incremental('development'))
  update_timestamp('development')
end

# desc 'Deploy the site'
# task :deploy => :build_for_deploy do
#   sh "rsync -auvz --checksum --delete --rsh=ssh --progress _site/ bert:XXX"
# end

desc 'Clean the site'
task :clean do
  rake_running
  jekyll('clean')
  jekyll('clean --destination _deploy', 'deploy')
end

desc 'Serve the site'
task :serve do
  rake_running
  jekyll('serve' + incremental('development'))
  update_timestamp('development')
end

desc 'Build the site for deployment'
task :build_for_deploy do
  rake_running
  jekyll('build --destination _deploy' + incremental('deploy'), 'deploy')
  update_timestamp('deploy')
end

desc 'Check the HTML output.'
task :check => :build_for_deploy do
  require 'html-proofer'

  HTMLProofer.check_directory("_site/", {
    :disable_external => false, # Change this when necessary
    :check_html => true,
    :url_swap => {
      %r'^/\~s/' => '/',
      %r'^https://www\.cs\.uic\.edu/\~s/' => '/',
    },
    :validation => {
      :report_invalid_tags => false, # It reports valid tags as invalid!
      :report_missing_names => true,
      :report_script_embeds => true,
    },
    :cache => { :timeframe => '1d' },
  }).run
end

def incremental?(env)
  timestamp = '.' + env
  if not File.exist?(timestamp)
    return false
  end
  last_build = File.mtime(timestamp)
  # Check _config.yml
  if File.mtime('_config.yml') > last_build
    return false
  end
  # Check Rakefile
  if File.mtime('Rakefile') > last_build
    return false
  end
  # Check for _data and any files inside _data
  if not Dir.exist?('_data')
    return true
  end
  if File.mtime('_data') > last_build
    return false
  end
  Dir.foreach('_data/') do |file|
    path = '_data/' + file
    next unless File.file?(path)
    if File.mtime(path) > last_build
      return false
    end
  end
  true
end

def incremental(env)
  if incremental?(env)
    ' --incremental'
  else
    ''
  end
end

def update_timestamp(env)
  FileUtils.touch('.' + env)
end

# Run a Jekyll command
def jekyll(directives, environment = nil)
  if environment.nil?
    sh "bundle exec jekyll #{directives}"
  else
    sh "JEKYLL_ENV=#{environment} bundle exec jekyll #{directives}"
  end
end

# check if there is another rake task running (in addition to this one!)
def rake_running
  num = `ps | grep 'rake' | grep -v 'grep' | wc -l`.to_i
  if num > 1 then
    puts "\n\nWarning! An instance of rake seems to be running (it might not be *this* Rakefile, however).\n"
    puts "Building while running other tasks (e.g., preview), might create a website with broken links.\n\n"
    puts "Are you sure you want to continue? [Y|n]"

    ans = STDIN.gets.chomp
    exit if ans != 'Y' 
  end
end


# vim: set sw=2 sts=2 ts=8 tw=0 expandtab:
