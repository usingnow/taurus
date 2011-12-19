class PersonExtendsController < ApplicationController
  # GET /person_extends
  # GET /person_extends.xml
  def index
    @person_extends = PersonExtend.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @person_extends }
    end
  end

  # GET /person_extends/1
  # GET /person_extends/1.xml
  def show
    @person_extend = PersonExtend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person_extend }
    end
  end

  # GET /person_extends/new
  # GET /person_extends/new.xml
  def new
    @person_extend = PersonExtend.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person_extend }
    end
  end

  # GET /person_extends/1/edit
  def edit
    @person_extend = PersonExtend.find(params[:id])
  end

  # POST /person_extends
  # POST /person_extends.xml
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

  # PUT /person_extends/1
  # PUT /person_extends/1.xml
  def update
    @person_extend = PersonExtend.find(params[:id])

    respond_to do |format|
      if @person_extend.update_attributes(params[:person_extend])
        format.html { redirect_to(@person_extend, :notice => 'Person extend was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person_extend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /person_extends/1
  # DELETE /person_extends/1.xml
  def destroy
    @person_extend = PersonExtend.find(params[:id])
    @person_extend.destroy

    respond_to do |format|
      format.html { redirect_to(person_extends_url) }
      format.xml  { head :ok }
    end
  end
end
