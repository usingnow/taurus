class Admin::EscsController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  # GET /escs
  # GET /escs.xml
  def index
    @escs = Esc.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @escs }
    end
  end

  # GET /escs/1
  # GET /escs/1.xml
  def show
    @esc = Esc.find(params[:id])
    @esc_reply = EscReply.new(:esc_id=>@esc.id)
    @esc_replies = EscReply.find_all_by_esc_id(@esc.id)



    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @esc }
    end
  end

  # GET /escs/new
  # GET /escs/new.xml
  def new
    @esc = Esc.new(:number=>current_serial_number("SJ"))

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @esc }
    end
  end

  # GET /escs/1/edit
  def edit
    @esc = Esc.find(params[:id])
  end

  # POST /escs
  # POST /escs.xml
  def create
    @esc = Esc.new(params[:esc])
    @esc.created_by = current_administrator.id

    respond_to do |format|
      if @esc.save
        format.html { redirect_to(admin_escs_url, :notice => 'Esc was successfully created.') }
        format.xml  { render :xml => @esc, :status => :created, :location => @esc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @esc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /escs/1
  # PUT /escs/1.xml
  def update
    @esc = Esc.find(params[:id])

    respond_to do |format|
      if @esc.update_attributes(params[:esc])
        format.html { redirect_to(admin_escs_url, :notice => 'Esc was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @esc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /escs/1
  # DELETE /escs/1.xml
  def destroy
    @esc = Esc.find(params[:id])
    @esc.destroy

    respond_to do |format|
      format.html { redirect_to(admin_escs_url) }
      format.xml  { head :ok }
    end
  end
end
