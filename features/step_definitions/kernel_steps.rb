Given /^the fixture file "(.*?)"$/ do |filename|
  @input = fixture_file(filename)
  @filename = filename
end

Given /^I put them through the kernel$/ do
  @output = "output_#{rand(1000)}_#{@filename}"
  kernel(@input, @output).classify
end

Then /^the output should match the fixture "(.*?)"$/ do |filename|
  fixture_output = File.readlines(fixture_file(filename))[1..-1].join()
  output =  File.readlines(tmp_file(@output))[1..-1].join()
  output.should eql(fixture_output)
  File.delete(tmp_file(@output))
end

def fixture_file(filename)
  File.absolute_path("features/fixtures/", kernel_root) + "/#{filename}"
end

def tmp_file(filename)
  File.absolute_path("tmp/", kernel_root) + "/#{filename}"
end

