class SimplePagesController < ApplicationController
  include SimplePages

  def plus
    @total = 0 + 1
  end

  def minus
    @total = 0 - 1
  end
end
