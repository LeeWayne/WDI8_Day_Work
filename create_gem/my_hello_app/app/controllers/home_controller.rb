class HomeController < ApplicationController
  def index
    @language, @hello = HelloWorld.random
  end
end
