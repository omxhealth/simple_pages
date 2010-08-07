require 'spec_helper'

class I18nSimplePagesController < ActionController::Base
  include SimplePages
end

I18nSimplePagesController.view_paths = File.join(File.dirname(__FILE__) + '/../views')

ActionController::Routing::Routes.draw do |map|
  map.resources :i18n_simple_pages
end

describe I18nSimplePagesController do
  integrate_views
  
  describe "template rendering" do
    describe "contact page" do
      before { get :show, :id => "contact" }

      specify { should render_template "contact" }
    end

    describe "página de contato" do
      context "when the locale param is defined" do
        before { get :show, :id => "contato", :locale => "pt" }

        specify { should render_template "i18n_simple_pages/pt/contato" }
        
        it "should define the locale" do
          I18n.locale.should == :pt
        end
        
        after { I18n.locale = I18n.default_locale }
      end
      
      context "when the locale param is not defined" do
        before { get :show, :id => "contato" }

        specify { should render_template "not_found" }
      end
      
      context "when the locale is defined" do
        before do
          I18n.locale = "pt"
          get :show, :id => "contato"
        end

        specify { should render_template "i18n_simple_pages/pt/contato" }
        
        after { I18n.locale = I18n.default_locale }
      end
      
      context "when the locale param is not defined" do
        before { get :show, :id => "contato" }

        specify { should render_template "not_found" }
      end
    end
  end
end