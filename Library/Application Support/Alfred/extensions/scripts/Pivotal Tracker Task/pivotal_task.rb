require 'net/http'
require 'yaml'

INPUT = ARGV.pop
CONFIG_PATH = File.join(ENV["HOME"], ".alfred_pivotal_config")

if INPUT =~ /^(feature|bug|chore|release)\s+(.+)/
  STORY_TYPE = $1
  STORY_NAME = $2
else
  STORY_TYPE = "feature"
  STORY_NAME = INPUT
end

def prompt(message)
  `osascript -e '
  tell application "System Events" to display dialog "#{message}" default answer ""
  text returned of result
  '`.strip
end


# Configuration
# -------------
begin
  config = YAML.load_file(CONFIG_PATH)
rescue Exception
  config = {}
end

unless config['auth_token']
  `open https://www.pivotaltracker.com/profile#api`
  sleep 1.0
  config['auth_token'] = prompt("Please enter your pivotal tracker API token:")
end

unless config['project_id']
  config['project_id'] = prompt("Please enter the project ID:")
end

unless config['project_id']
  config['project_id'] = prompt("Please enter the project ID:")
end


# Story Posting
# -------------
result = `curl -H "X-TrackerToken: #{config['auth_token']}" -X POST -H "Content-type: application/xml" \
  -d "<story><story_type>#{STORY_TYPE}</story_type><name>#{STORY_NAME}</name></story>" \
  http://www.pivotaltracker.com/services/v3/projects/#{config['project_id']}/stories`

if result =~ /<url>(http:\/\/www.pivotaltracker.com\/story\/show\/\d+)<\/url>/
  puts $1
end


# Cleanup
# -------
File.open(CONFIG_PATH, 'w') { |f| f.write(config.to_yaml) }
