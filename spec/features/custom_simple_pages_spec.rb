require "spec_helper"

feature "Custom Simple Pages" do
  it "when the template and action exist" do
    visit "/custom_pages/plus"

    page.should have_content "1"
  end

  it "when the action exists but the template doesn't" do
    visit "/custom_pages/minus"

    page.should have_content "-1"
  end
end
