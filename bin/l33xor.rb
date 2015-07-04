require 'require_all'
require 'io/console'
require 'yaml'

require_rel '../lib/'

def write_config_file(replacement_hash)
  config_file = File.open("config.yaml", "w")
  config_file.puts(YAML.dump(replacement_hash))
end

def load_config_file
  replacement_hash_yaml = File.open("config.yaml").read
  $current_mode = YAML.load(replacement_hash_yaml)
end

begin
  load_config_file
rescue
  puts "D'oh! The config file wasn't configured correctly!"
  puts "Configuring the config file now..."
  write_config_file(ReplacementHash::DEFAULT)
end

def stdin_translation(translation_hash)
  puts "Please input your string:"
  to_l33t = $stdin.gets.chomp

  l33ted = Substitution.hsub(to_l33t, translation_hash)

  puts "j00r t0t4lly l33t tr4nsl4t10n:\n"

  puts l33ted

  $stdin.getch
  puts ""
  false
end

def stdin_reverse_translation(translation_hash)
  puts "Pl34s3 1nput t|-|3 l33t."

  to_normal = $stdin.gets.chomp

  normal = Substitution.reverse_leet(to_normal, translation_hash)

  puts "Your now-normal string:\n"
  puts normal

  $stdin.getch
  puts ""
  false
end

def display_configuration(translation_mode)
  puts "Configuration: "
  case translation_mode
  when ReplacementHash::DEFAULT
    puts "Mode: Default"
  when ReplacementHash::HARDCORE
    puts "Mode: Hardcore" # end
  else
    puts "Error! Translation settings not configured!"
  end
end

def eval_config_input(input)
  should_break = false

  case input.downcase
  when 'd'
    $current_mode = ReplacementHash::DEFAULT
  when 'h'
    $current_mode = ReplacementHash::HARDCORE
  when 'q'
    puts "Quiting configuration."
    should_break = true
  end

  puts ""
  write_config_file($current_mode)
  should_break
end

def set_configuration
  loop do
    display_configuration($current_mode)

    puts ""

    puts "Change current translation mode to?"
    puts "d. Default"
    puts "h. Hardcore"
    puts "q. Quit"

    input = $stdin.getch
    break if eval_config_input(input)

    puts ""
  end
end

def eval_choice(choice, translation_hash)
  puts ""

  case choice.downcase
  when 't'
    stdin_translation(translation_hash)
  when 'r'
    stdin_reverse_translation(translation_hash)
  when 'c'
    set_configuration
  when 'q'
    puts "Quiting..."
    true
  else
    puts "That was not a valid choice."
    puts "Restarting..."
  end
end

loop do
  puts "Welcome to l33xor, a l33t translator written in Ruby.\n"
  puts "t. stdin translation from normal to l33t"
  puts "r. stdin translation from l33t to normal"
  puts "c. Configuration"
  puts "q. Quit"

  choice = $stdin.getch

  break if eval_choice(choice, $current_mode)
end
