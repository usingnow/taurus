class Admin::PersonExtendsController < ApplicationController
  def index
    @person_extends = PersonExtend.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @person_extends }
    end
  end

  def new
    @person_extend = PersonExtend.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person_extend }
    end
  end

end
