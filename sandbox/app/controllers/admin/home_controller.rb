class Admin::HomeController < ApplicationController
  before_filter :authenticate_administrator!

  def index

  end
end
