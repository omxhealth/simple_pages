# encoding: utf-8

require 'spec_helper'

describe I18nSimplePagesController do
  render_views

  describe "template rendering" do
    describe "contact page" do
      before { get :show, :id => "contact" }

      it { should render_template "contact" }
    end

    describe "página de contato" do
      context "when the locale param is defined" do
        before { get :show, :id => "contato", :locale => "pt" }

        it { should render_template "i18n_simple_pages/pt/contato" }

        it "should define the locale" do
          I18n.locale.should == :pt
        end

        after { I18n.locale = I18n.default_locale }
      end

      context "when the locale param is not defined" do
        before { get :show, :id => "contato" }

        it { should render_template "not_found" }
      end

      context "when the locale is defined" do
        before do
          I18n.locale = "pt"
          get :show, :id => "contato"
        end

        it { should render_template "i18n_simple_pages/pt/contato" }

        after { I18n.locale = I18n.default_locale }
      end

      context "when the locale param is not defined" do
        before { get :show, :id => "contato" }

        it { should render_template "not_found" }
      end
    end
  end
end
