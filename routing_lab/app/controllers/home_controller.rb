class HomeController < ApplicationController

  def a
    @which_action = 'a'
    render 'menu'
  end

  def b
    @which_action = 'b'
    render 'menu'
  end
  
  def one
    @which_action = '1'
    render 'menu'
  end

  def two
    @which_action = '2'
    render 'menu'
  end

  def three
    @which_action = '3'
    render 'menu'
  end

  def start
    render 'menu'
  end



  def door
    case params['option'].downcase
    when 'a' then redirect_to('/a')
    when 'b' then redirect_to('/b')
    when '1' then redirect_to('/1')
    when '2' then redirect_to('/2')
    when '3' then redirect_to('/3')
    else render 'menu'
    end
  end


end