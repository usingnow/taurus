class Admin::PersonExtendsController < ApplicationController
  def index
    @person_extends = PersonExtend.all
  end

  def new
    @person_extend = PersonExtend.new
  end

  def create
    @person_extend = PersonExtend.new(params[:person_extend])

    respond_to do |format|
      if @person_extend.save
        format.html { redirect_to(@person_extend, :notice => 'Person extend was successfully created.') }
        format.xml  { render :xml => @person_extend, :status => :created, :location => @person_extend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person_extend.errors, :status => :unprocessable_entity }
      end
    end
  end

end
