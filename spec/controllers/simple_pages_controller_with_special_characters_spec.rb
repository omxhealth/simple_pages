# encoding: utf-8

require "spec_helper"

describe SimplePagesController, "using special characters like" do
  context "\"testing-testing\"" do
    before { get :show, :id => 'testing-testing' }

    it { should render_template 'testing_testing' }
  end

  context "\"são-paulo-ribeirão\"" do
    before { get :show, :id => 'são-paulo-ribeirão' }

    it { should render_template 'sao_paulo_ribeirao' }
  end

  context "\"testing-testing\"" do
    before { get :show, :id => 'testing-testing' }

    it { should render_template 'testing_testing' }
  end

  context "\"são-paulo_ribeirão\"" do
    before { get :show, :id => 'são-paulo_ribeirão' }

    it { should render_template 'sao_paulo_ribeirao' }
  end

  context "\"são-paulo ribeirão\"" do
    before { get :show, :id => 'são-paulo%20ribeirão' }

    it { should render_template 'sao_paulo_ribeirao' }
  end
end
