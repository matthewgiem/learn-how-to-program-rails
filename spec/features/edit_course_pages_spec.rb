require 'rails_helper'

describe "the edit a course process" do
  it "edits a course" do
    course = Course.create(:name => 'Rails')
    visit course_path(course)
    click_on 'Edit'
    fill_in 'Name', :with => 'Javascript'
    click_on 'Update Course'
    expect(page).to have_content 'Javascript'
  end

  it "gives error when no name is entered" do
    course = Course.create(:name => 'Rails')
    visit course_path(course)
    click_on 'Edit'
    fill_in 'Name', :with => ''
    click_button 'Update Course'
    expect(page).to have_content 'errors'
  end
end
