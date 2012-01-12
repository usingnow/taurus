class Admin::PanicBuyingsController < ApplicationController
  # GET /panic_buyings
  # GET /panic_buyings.xml
  def index
    @panic_buyings = PanicBuying.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @panic_buyings }
    end
  end

  # GET /panic_buyings/1
  # GET /panic_buyings/1.xml
  def show
    @panic_buying = PanicBuying.find(params[:id])
  end

  # GET /panic_buyings/new
  # GET /panic_buyings/new.xml
  def new
    @panic_buying = PanicBuying.new
  end

  # GET /panic_buyings/1/edit
  def edit
    @panic_buying = PanicBuying.find(params[:id])
  end

  # POST /panic_buyings
  # POST /panic_buyings.xml
  def create
    @panic_buying = PanicBuying.new(params[:panic_buying])

    respond_to do |format|
      if @panic_buying.save
        format.html { redirect_to(admin_panic_buyings_url, :notice => 'Panic buying was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /panic_buyings/1
  # PUT /panic_buyings/1.xml
  def update
    @panic_buying = PanicBuying.find(params[:id])

    respond_to do |format|
      if @panic_buying.update_attributes(params[:panic_buying])
        format.html { redirect_to(admin_panic_buyings_url, :notice => 'Panic buying was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @panic_buying.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /panic_buyings/1
  # DELETE /panic_buyings/1.xml
  def destroy
    @panic_buying = PanicBuying.find(params[:id])
    @panic_buying.destroy

    respond_to do |format|
      format.html { redirect_to(admin_panic_buyings_url) }
      format.xml  { head :ok }
    end
  end
end
