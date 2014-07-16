Given(/^a nominal attribute, named "(.*?)", with values "(.*?)"$/) do |name, values|
  @first_att = name.to_sym
  @values = values.split(',')
end

Given(/^a numeric attribute, named "(.*?)"$/) do |name|
  @second_att = name.to_sym
end

Given(/^a string attribute, named "(.*?)"$/) do |name|
  @third_att = name.to_sym
end

Given(/^two data rows: "(.*?)","(.*?)"$/) do |first_row, second_row|
  first = first_row.split(',')
  second = second_row.split(',')

  @first_row = [first[0], first[1].to_f, first[2]]
  @second_row = [second[0], second[1].to_f, second[2]]
end

Then(/^I want to build an empty dataset for my use$/) do
  first_att = @first_att
  values = @values
  second_att = @second_att
  third_att = @third_att

  @my_instance = Core::Type::Instances::Base.new do
    nominal first_att, values
    numeric second_att
    string third_att
  end

  @my_instance.summary
end

Then(/^I want to populate the dataset by row$/) do
  @my_instance.populate_by_row([@first_row, @second_row])
  @my_instance.summary
end

Then(/^I want to print my dataset as a bidimensional Ruby Array$/) do
  puts @my_instance.to_a2d.inspect
end

Then(/^the dataset's attributes should have the defined types$/) do
  @my_instance.instance(0).should be_nominal?
  @my_instance.instance(1).should be_numeric?
  @my_instance.instance(2).should be_string?
end