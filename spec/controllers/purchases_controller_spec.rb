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

describe PurchasesController do

  # This should return the minimal set of attributes required to create a valid
  # Purchase. As you add validations to Purchase, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all purchases as @purchases" do
      purchase = Purchase.create! valid_attributes
      get :index
      assigns(:purchases).should eq([purchase])
    end
  end

  describe "GET show" do
    it "assigns the requested purchase as @purchase" do
      purchase = Purchase.create! valid_attributes
      get :show, :id => purchase.id
      assigns(:purchase).should eq(purchase)
    end
  end

  describe "GET new" do
    it "assigns a new purchase as @purchase" do
      get :new
      assigns(:purchase).should be_a_new(Purchase)
    end
  end

  describe "GET edit" do
    it "assigns the requested purchase as @purchase" do
      purchase = Purchase.create! valid_attributes
      get :edit, :id => purchase.id
      assigns(:purchase).should eq(purchase)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Purchase" do
        expect {
          post :create, :purchase => valid_attributes
        }.to change(Purchase, :count).by(1)
      end

      it "assigns a newly created purchase as @purchase" do
        post :create, :purchase => valid_attributes
        assigns(:purchase).should be_a(Purchase)
        assigns(:purchase).should be_persisted
      end

      it "redirects to the created purchase" do
        post :create, :purchase => valid_attributes
        response.should redirect_to(Purchase.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved purchase as @purchase" do
        # Trigger the behavior that occurs when invalid params are submitted
        Purchase.any_instance.stub(:save).and_return(false)
        post :create, :purchase => {}
        assigns(:purchase).should be_a_new(Purchase)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Purchase.any_instance.stub(:save).and_return(false)
        post :create, :purchase => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested purchase" do
        purchase = Purchase.create! valid_attributes
        # Assuming there are no other purchases in the database, this
        # specifies that the Purchase created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Purchase.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => purchase.id, :purchase => {'these' => 'params'}
      end

      it "assigns the requested purchase as @purchase" do
        purchase = Purchase.create! valid_attributes
        put :update, :id => purchase.id, :purchase => valid_attributes
        assigns(:purchase).should eq(purchase)
      end

      it "redirects to the purchase" do
        purchase = Purchase.create! valid_attributes
        put :update, :id => purchase.id, :purchase => valid_attributes
        response.should redirect_to(purchase)
      end
    end

    describe "with invalid params" do
      it "assigns the purchase as @purchase" do
        purchase = Purchase.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Purchase.any_instance.stub(:save).and_return(false)
        put :update, :id => purchase.id, :purchase => {}
        assigns(:purchase).should eq(purchase)
      end

      it "re-renders the 'edit' template" do
        purchase = Purchase.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Purchase.any_instance.stub(:save).and_return(false)
        put :update, :id => purchase.id, :purchase => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested purchase" do
      purchase = Purchase.create! valid_attributes
      expect {
        delete :destroy, :id => purchase.id
      }.to change(Purchase, :count).by(-1)
    end

    it "redirects to the purchases list" do
      purchase = Purchase.create! valid_attributes
      delete :destroy, :id => purchase.id
      response.should redirect_to(purchases_url)
    end
  end

end
