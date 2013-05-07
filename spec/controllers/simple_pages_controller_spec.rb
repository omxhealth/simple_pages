# encoding: utf-8

require 'spec_helper'

describe SimplePagesController do
  render_views

  context "when the template doesn't exist" do
    before { get :show, :id => 'nothing' }

    it { should render_template 'not_found' }
    it { response.should be_not_found }
  end

  context "when the template exists" do
    before { get :show, :id => 'testing' }

    it { should render_template 'testing' }
    it { response.should be_success }
  end

  context "when the template and action exist" do
    before { get :show, :id => 'plus' }

    it { should render_template 'plus' }
    it { response.should be_success }
    it { response.body.should =~ /1/ }
  end

  context "when the action exists but not the template" do
    before { get :show, :id => 'minus' }

    it { should render_template 'show' }
    it { response.should be_success }
    it { response.body.should =~ /\-1/ }
  end

  context "when the id is nil" do
    before { get :show, id: nil }
    it { response.should be_success }
    it { should render_template 'show' }
  end
end
