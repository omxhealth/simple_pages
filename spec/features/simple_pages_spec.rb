# encoding: utf-8

require "spec_helper"

feature "Default Simple Pages Controller" do
  it "when the template doesn't exist" do
    visit "/nothing"

    page.should have_content "The page you were looking for doesn't exist."
    page.status_code.should == 404
  end

  it "when the template exists" do
    visit "/testing"

    page.should have_content "This is a testing page!"
  end

  it "when the id is nil" do
    visit ""

    page.should have_content "This is the default page."
  end

  it "when the page is \"testing-testing\"" do
    visit "/testing-testing"

    page.should have_content "This is a double testing page."
  end

  it "when the page is \"são-paulo-ribeirão\"" do
    visit "/s%C3%A3o-paulo-ribeir%C3%A3o"

    page.should have_content "This page contains São Paulo and Ribeirão"
  end

  it "when the page is \"são-paulo_ribeirão\"" do
    visit "/s%C3%A3o-paulo_ribeir%C3%A3o"

    page.should have_content "This page contains São Paulo and Ribeirão"
  end

  it "when the page is \"são-paulo ribeirão\"" do
    visit "/s%C3%A3o-paulo%20ribeir%C3%A3o"

    page.should have_content "This page contains São Paulo and Ribeirão"
  end

  it "when the locale is not defined" do
    visit "/contact"

    page.should have_content "Contact Page"
  end

  it "when the locale param is defined" do
    visit "/contato?locale=pt"

    page.should have_content "Página de Contato"
  end

  it "when the locale param is defined in the path" do
    visit "/pt/contato"

    page.should have_content "Página de Contato"
  end

  it "when the locale param is not defined" do
    visit "/contato"
    page.should have_content "Página de Contato"
  end
end
