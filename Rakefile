require 'fileutils'

hosting_dir = "../uic-research.github.io"

task :default => :build

desc 'Build the site'
task :build do
  rake_running
  jekyll('build')
end

desc 'Deploy the site'
task :deploy => :build_for_deploy do
  unless Dir.exist?(hosting_dir)
    fail "Did you forget to clone #{hosting_dir}?"
  end
  preserve = ['.git']
  filters = preserve.map { |p| "--filter='P #{p}'" }.join(' ')
  #sh "rsync -auvz --checksum --delete --rsh=ssh #{filters} --progress _deploy/ ../uic-research.github.io/"
  sh "rsync -auz --delete --rsh=ssh #{filters} _deploy/ ../uic-research.github.io/"
  sh "cd #{hosting_dir} && git add -A && git commit -m 'Update' && git push"
end

desc 'Clean the site'
task :clean do
  rake_running
  jekyll('clean')
  jekyll('clean --destination _deploy', 'deploy')
end

desc 'Serve the site'
task :serve do
  rake_running
  jekyll('serve')
end

desc 'Build the site for deployment'
task :build_for_deploy do
  rake_running
  jekyll('build --destination _deploy', 'deploy')
end

desc 'Check the HTML output.'
task :check => :build_for_deploy do
  require 'html-proofer'

  HTMLProofer.check_directory("_deploy/", {
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
