class PagesController < ApplicationController
  allow_unauthenticated_access only: %i[ landing perks members_demo ]

  def landing
  end

  def perks
  end

  def members_demo
  end
end
