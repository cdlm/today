usage "today [args]"

flag :h, :help, 'show help for this command' do |_, cmd|
  puts cmd.help
  exit 0
end

run do |opts, args, cmd|
  puts 'hello'
end
