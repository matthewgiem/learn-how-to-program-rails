require 'rails_helper'

describe "the destroy a course process" do
  it "destroy a course" do
    course = Course.create(:name => 'Rails')
    visit course_path(course)
    click_on 'Delete'
    expect(page).to have_content "Courses"
  end

end
