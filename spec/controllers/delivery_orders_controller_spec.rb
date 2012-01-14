require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DeliveryOrdersController do

  # This should return the minimal set of attributes required to create a valid
  # DeliveryOrder. As you add validations to DeliveryOrder, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all delivery_orders as @delivery_orders" do
      delivery_order = DeliveryOrder.create! valid_attributes
      get :index
      assigns(:delivery_orders).should eq([delivery_order])
    end
  end

  describe "GET show" do
    it "assigns the requested delivery_order as @delivery_order" do
      delivery_order = DeliveryOrder.create! valid_attributes
      get :show, :id => delivery_order.id
      assigns(:delivery_order).should eq(delivery_order)
    end
  end

  describe "GET new" do
    it "assigns a new delivery_order as @delivery_order" do
      get :new
      assigns(:delivery_order).should be_a_new(DeliveryOrder)
    end
  end

  describe "GET edit" do
    it "assigns the requested delivery_order as @delivery_order" do
      delivery_order = DeliveryOrder.create! valid_attributes
      get :edit, :id => delivery_order.id
      assigns(:delivery_order).should eq(delivery_order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DeliveryOrder" do
        expect {
          post :create, :delivery_order => valid_attributes
        }.to change(DeliveryOrder, :count).by(1)
      end

      it "assigns a newly created delivery_order as @delivery_order" do
        post :create, :delivery_order => valid_attributes
        assigns(:delivery_order).should be_a(DeliveryOrder)
        assigns(:delivery_order).should be_persisted
      end

      it "redirects to the created delivery_order" do
        post :create, :delivery_order => valid_attributes
        response.should redirect_to(DeliveryOrder.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved delivery_order as @delivery_order" do
        # Trigger the behavior that occurs when invalid params are submitted
        DeliveryOrder.any_instance.stub(:save).and_return(false)
        post :create, :delivery_order => {}
        assigns(:delivery_order).should be_a_new(DeliveryOrder)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DeliveryOrder.any_instance.stub(:save).and_return(false)
        post :create, :delivery_order => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested delivery_order" do
        delivery_order = DeliveryOrder.create! valid_attributes
        # Assuming there are no other delivery_orders in the database, this
        # specifies that the DeliveryOrder created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DeliveryOrder.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => delivery_order.id, :delivery_order => {'these' => 'params'}
      end

      it "assigns the requested delivery_order as @delivery_order" do
        delivery_order = DeliveryOrder.create! valid_attributes
        put :update, :id => delivery_order.id, :delivery_order => valid_attributes
        assigns(:delivery_order).should eq(delivery_order)
      end

      it "redirects to the delivery_order" do
        delivery_order = DeliveryOrder.create! valid_attributes
        put :update, :id => delivery_order.id, :delivery_order => valid_attributes
        response.should redirect_to(delivery_order)
      end
    end

    describe "with invalid params" do
      it "assigns the delivery_order as @delivery_order" do
        delivery_order = DeliveryOrder.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DeliveryOrder.any_instance.stub(:save).and_return(false)
        put :update, :id => delivery_order.id, :delivery_order => {}
        assigns(:delivery_order).should eq(delivery_order)
      end

      it "re-renders the 'edit' template" do
        delivery_order = DeliveryOrder.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DeliveryOrder.any_instance.stub(:save).and_return(false)
        put :update, :id => delivery_order.id, :delivery_order => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested delivery_order" do
      delivery_order = DeliveryOrder.create! valid_attributes
      expect {
        delete :destroy, :id => delivery_order.id
      }.to change(DeliveryOrder, :count).by(-1)
    end

    it "redirects to the delivery_orders list" do
      delivery_order = DeliveryOrder.create! valid_attributes
      delete :destroy, :id => delivery_order.id
      response.should redirect_to(delivery_orders_url)
    end
  end

end
