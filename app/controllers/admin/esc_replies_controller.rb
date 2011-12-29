#encoding:UTF-8
class Admin::EscRepliesController < ApplicationController
  # GET /esc_replies
  # GET /esc_replies.xml
  def index
    @esc_replies = EscReply.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @esc_replies }
    end
  end

  # GET /esc_replies/1
  # GET /esc_replies/1.xml
  def show
    @esc_reply = EscReply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @esc_reply }
    end
  end

  # GET /esc_replies/new
  # GET /esc_replies/new.xml
  def new
    @esc_reply = EscReply.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @esc_reply }
    end
  end

  # GET /esc_replies/1/edit
  def edit
    @esc_reply = EscReply.find(params[:id])
  end

  # POST /esc_replies
  # POST /esc_replies.xml
  def create
    @esc_reply = EscReply.new(params[:esc_reply])
    esc = Esc.find(@esc_reply.esc_id)
    if esc.status == 1
      status = "已升级"
    elsif esc.status == 2
      status = "已解决"
    else
      status = "已回复"
    end
    @esc_reply.status_changed_info = status+'->'+@esc_reply.status_changed_info

    respond_to do |format|
      if @esc_reply.save
        format.html { redirect_to(admin_escs_url, :notice => 'Esc reply was successfully created.') }
        format.xml  { render :xml => @esc_reply, :status => :created, :location => @esc_reply }
      else
        format.html { redirect_to(admin_esc_url(@esc_reply.esc_id)) }
        format.xml  { render :xml => @esc_reply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /esc_replies/1
  # PUT /esc_replies/1.xml
  def update
    @esc_reply = EscReply.find(params[:id])

    respond_to do |format|
      if @esc_reply.update_attributes(params[:esc_reply])
        format.html { redirect_to(@esc_reply, :notice => 'Esc reply was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @esc_reply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /esc_replies/1
  # DELETE /esc_replies/1.xml
  def destroy
    @esc_reply = EscReply.find(params[:id])
    @esc_reply.destroy

    respond_to do |format|
      format.html { redirect_to(esc_replies_url) }
      format.xml  { head :ok }
    end
  end
end
