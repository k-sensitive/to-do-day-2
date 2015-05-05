require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click a list to see the task and details for it') do
    visit('/')
    click_link('Add New List')
    fill_in('name',:with  => 'Garden')
    click_button('Add List')
    expect(page).to have_content('Success')
  end
end

describe(".find") do
  it('returns a list by its ID') do
    test_list = List.new({:name => "Garden", :id => nil})
    test_list.save()
    test_list2 = List.new({:name => "House", :id => nil})
    test_list2.save()
    expect(List.find(test_list2.id())).to(eq(test_list2))
  end
end
