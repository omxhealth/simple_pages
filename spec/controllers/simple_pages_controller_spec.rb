require 'spec_helper'

class SimplePagesController < ActionController::Base
  include SimplePages

  def plus
    @total = 0 + 1
  end

  def minus
    @total = 0 - 1
  end
end

ActionController::Routing::Routes.draw do |map|
  map.resources :simple_pages
end

describe SimplePagesController do
  integrate_views
  
  before do
    SimplePagesController.view_paths = File.join(File.dirname(__FILE__) + '/../views')
  end

  context "when the template doesn't exist" do
    before { get :show, :id => 'nothing' }
    
    specify { should render_template 'not_found' }
    specify { response.should be_not_found }
  end

  context "when the template exists" do
    before { get :show, :id => 'testing' }
    
    specify { should render_template 'testing' }
    specify { response.should be_success }
  end
  
  context "when the template and action exist" do
    before { get :show, :id => 'plus' }
    
    specify { should render_template 'plus' }
    specify { response.should be_success }
    specify { response.should have_text '1' }
  end
  
  context "when the action exists but not the template" do
    before { get :show, :id => 'minus' }
    
    specify { should render_template 'show' }
    specify { response.should be_success }
    specify { response.should have_text '-1' }
  end
end

describe SimplePagesController, "using special characters like" do
  context "\"testing-testing\"" do
    before { get :show, :id => 'testing-testing' }
    
    specify { should render_template 'testing_testing' }
  end
  
  context "\"são-paulo-ribeirão\"" do
    before { get :show, :id => 'são-paulo-ribeirão' }
    
    specify { should render_template 'sao_paulo_ribeirao' }
  end
  
  context "\"testing-testing\"" do
    before { get :show, :id => 'testing-testing' }
    
    specify { should render_template 'testing_testing' }
  end
  
  context "\"são-paulo_ribeirão\"" do
    before { get :show, :id => 'são-paulo_ribeirão' }
    
    specify { should render_template 'sao_paulo_ribeirao' }
  end
  
  context "\"testing-testing\"" do
    before { get :show, :id => 'testing-testing' }
    
    specify { should render_template 'testing_testing' }
  end
  
  context "\"são-paulo ribeirão\"" do
    before { get :show, :id => 'são-paulo%20ribeirão' }
    
    specify { should render_template 'sao_paulo_ribeirao' }
  end
end