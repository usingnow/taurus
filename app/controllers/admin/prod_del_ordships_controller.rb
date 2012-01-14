class Admin::ProdDelOrdshipsController < ApplicationController
  # GET /prod_del_ordships
  # GET /prod_del_ordships.xml
  def index
    @prod_del_ordships = ProdDelOrdship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prod_del_ordships }
    end
  end

  # GET /prod_del_ordships/1
  # GET /prod_del_ordships/1.xml
  def show
    @prod_del_ordship = ProdDelOrdship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prod_del_ordship }
    end
  end

  # GET /prod_del_ordships/new
  # GET /prod_del_ordships/new.xml
  def new
    @prod_del_ordship = ProdDelOrdship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prod_del_ordship }
    end
  end

  # GET /prod_del_ordships/1/edit
  def edit
    @prod_del_ordship = ProdDelOrdship.find(params[:id])
  end

  # POST /prod_del_ordships
  # POST /prod_del_ordships.xml
  def create
    @prod_del_ordship = ProdDelOrdship.new(params[:prod_del_ordship])

    respond_to do |format|
      if @prod_del_ordship.save
        format.html { redirect_to(@prod_del_ordship, :notice => 'Prod del ordship was successfully created.') }
        format.xml  { render :xml => @prod_del_ordship, :status => :created, :location => @prod_del_ordship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prod_del_ordship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prod_del_ordships/1
  # PUT /prod_del_ordships/1.xml
  def update
    @prod_del_ordship = ProdDelOrdship.find(params[:id])

    respond_to do |format|
      if @prod_del_ordship.update_attributes(params[:prod_del_ordship])
        format.html { redirect_to(@prod_del_ordship, :notice => 'Prod del ordship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prod_del_ordship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prod_del_ordships/1
  # DELETE /prod_del_ordships/1.xml
  def destroy
    @prod_del_ordship = ProdDelOrdship.find(params[:id])
    @prod_del_ordship.destroy

    respond_to do |format|
      format.html { redirect_to(prod_del_ordships_url) }
      format.xml  { head :ok }
    end
  end
end
