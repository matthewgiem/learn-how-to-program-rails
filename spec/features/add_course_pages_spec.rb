require 'rails_helper'

describe 'the add a course process' do
  it "adds a new course" do
    visit courses_path
    click_link "New Course"
    expect(page).to have_content "New Course"
    fill_in 'course_name', :with => "Rails"
    click_on "Create Course"
    expect(page).to have_content "Courses"
  end

  it "gives an error when no name is entered" do
    visit new_course_path
    click_on "Create Course"
    expect(page).to have_content 'errors'
  end
end
