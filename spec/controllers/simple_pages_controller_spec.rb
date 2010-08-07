require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

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

  context "not found" do
    before { get :show, :id => 'nothing' }
    
    specify { should render_template 'not_found' }
    specify { response.should be_not_found }
  end

  context "render page testing" do
    before { get :show, :id => 'testing' }
    
    specify { should render_template 'testing' }
    specify { response.should be_success }
  end
  
  context "executing an action" do
    before { get :show, :id => 'plus' }
    
    specify { should render_template 'plus' }
    specify { response.should be_success }
    specify { response.should have_text '1' }
  end
  
  context "executing an action without template" do
    before { get :show, :id => 'minus' }
    
    specify { should render_template 'show' }
    specify { response.should be_success }
    specify { response.should have_text '-1' }
  end
end