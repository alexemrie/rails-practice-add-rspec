require 'rails_helper'

feature 'Events' do

  scenario 'User edits an event' do
    Event.create!(description: 'My aweeesome event')

    visit root_path
    expect(page).to have_content('My aweeesome event')
    click_on 'edit'
    fill_in 'Description', with: 'My awesome event'
    click_on 'Update Event'

    expect(page).to have_content('My awesome event')
    expect(page).to have_no_content('My aweeesome event')
  end

  scenario 'Delete an event' do
    Event.create!(description: 'Let us play')

    visit root_path

    click_on 'delete'

    expect(page).to have_no_content('Let us play')
  end

  scenario 'User can select an event' do
    Event.create!(description: 'Let us play')

    visit root_path

    click_on 'Let us play'

    expect(page).to have_content('Let us play')
  end

  scenario 'User can create a new event' do
    visit root_path
    click_on 'New Event'
    fill_in 'Description', with: ('My new event')
    fill_in 'Location', with: ('Down by the River')
    page.find('#event_date').set("2014-01-01")
    fill_in 'Capacity', with: (14)
    page.find('#event_requires_id').set(true)

    click_on 'Create Event'

    expect(page).to have_content('My new event')
    expect(page).to have_content('Down by the River')
    expect(page).to have_content('14')
    expect(page).to have_content('2014-01-01')
    expect(page).to have_content('true')

    save_and_open_page
  end

end
