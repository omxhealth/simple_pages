require File.expand_path(File.dirname(__FILE__) + '/test_helper')

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

class SimplePagesControllerTest < ActionController::TestCase
  def setup
    SimplePagesController.view_paths = File.join(File.dirname(__FILE__) + '/views')
  end

  def test_not_found
    get :show, :id => 'nothing'
    assert_response :not_found
    assert_template 'not_found'
  end

  def test_runs_a_page
    get :show, :id => 'testing'
    assert_response :success
    assert_template 'testing'
  end

  def test_executing_an_action
    get :show, :id => 'plus'
    assert_equal '1', @response.body
    assert_template 'plus'
  end

  def test_executing_an_action_without_template
    get :show, :id => 'minus'
    assert_equal '-1', @response.body
    assert_template 'show'
  end
end