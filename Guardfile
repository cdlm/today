def branch_tests path
    tests = []
    begin
      path, file = File.split path
      path = '' if path == '.'
      tests << File.join("test", path, "test_#{file}.rb")
    end until path.empty?
    tests
end

guard 'minitest' do
  watch(%r|^test/(.*)\/?test_(.*)\.rb|)
  watch(%r|^lib/(.*)\.rb|) { |m| branch_tests m[1] }
  watch(%r|^test/helper\.rb|)           { "test" }
end
