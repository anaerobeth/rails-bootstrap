require 'spec_helper'

feature 'Home page' do
  scenario 'visit the home page', :js do
    visit root_path

    # header
    expect(page).to have_content 'LIVEDASHBOARD'
    expect(page).to have_content Time.current.strftime("%a %b %-d")
    expect(page).to have_content Time.current.strftime("%-l:%M %p")

    # school section
    within '.school-section' do
      expect(page).to have_content 'Our School'
      expect(page).to have_link 'Founders Memorial'
    end

    # people section
    within '.people-section' do
      expect(page).to have_content 'Our People'
      expect(page).to have_link 'Faculty/Staff'
    end

    # tags section
    within '.tags-section' do
      expect(page).to have_content 'Tags'

      within '.tags-section__grade' do
        expect(page).to have_link '9'
      end

      within '.tags-section__subject' do
        expect(page).to have_content 'Science'
      end

      within '.tags-section__gender' do
        expect(page).to have_content 'Female'
      end
    end

    # groups section
    within '.groups-section' do
      expect(page).to have_content 'My Groups'
      expect(page).to have_link 'ESL 9th Graders'
    end

    # community section
    within '.community-section' do
      within '.community-section__title' do
        expect(page).to have_content 'COMMUNITY'
      end

      #pending content for calendar section
      #within '.community-section__period' do
        #expect(page).to have_content 'Period'
        #expect(page).to have_content 'T'
      #end

      expect(page).to have_content 'Response Rates'
    end
    expect(page).to have_css('svg')

    #  live questions section
    within '.livequestions-section' do
      within '.livequestions-section__title' do
        expect(page).to have_content /LIVEQUESTIONS/i
      end

      within '.livequestions-section__subhead' do
        expect(page).to have_content '5 left out of 20'
      end

      expect(page).to have_content 'Text'
      expect(page).to have_content 'Response'
      expect(page).to have_content 'Schedule'
      expect(page).to have_button 'SEND NOW'
      #pending content for calendar section
      #expect(page).to have_content 'SEND LATER'
      #expect(page).to have_content 'YOUR MESSAGE WILL BE SENT'
      #expect(page).to have_button 'Schedule'
    end

    # display section
    within '.display-section' do
      within '.display-section__title' do
        expect(page).to have_content 'DISPLAY'
      end

      within '.display-section__primary' do
        expect(page).to have_content 'Resilience'
        expect(page).to have_content 'Safety'
      end

      within '.display-section__secondary' do
        expect(page).to have_content 'Composite'
        expect(page).to have_content 'Whose Responses'
        expect(page).to have_content 'Students'
      end
    end

    # results section
    within '.results-section' do
      within '.results-section__title' do
        expect(page).to have_content 'RESULTS'
      end

      within '.results-section__primary' do
        expect(page).to have_content 'Resilience'
        expect(page).to have_content 'Safety'
      end

      within '.results-section__secondary' do
        expect(page).to have_content 'Search'
        page.assert_selector('input#search-result', :count => 1)
      end

      within '.results-section__graph1' do
        expect(page).to have_content 'This week my teacher let me know that I did a good job.'
        expect(page).to have_css('svg')
      end

      within '.results-section__graph2' do
        expect(page).to have_content 'Our school administrators looked out for our needs this week.'
        expect(page).to have_css('svg')
      end
    end
  end
end
