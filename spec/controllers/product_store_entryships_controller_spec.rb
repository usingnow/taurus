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

describe ProductStoreEntryshipsController do

  # This should return the minimal set of attributes required to create a valid
  # ProductStoreEntryship. As you add validations to ProductStoreEntryship, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all product_store_entryships as @product_store_entryships" do
      product_store_entryship = ProductStoreEntryship.create! valid_attributes
      get :index
      assigns(:product_store_entryships).should eq([product_store_entryship])
    end
  end

  describe "GET show" do
    it "assigns the requested product_store_entryship as @product_store_entryship" do
      product_store_entryship = ProductStoreEntryship.create! valid_attributes
      get :show, :id => product_store_entryship.id
      assigns(:product_store_entryship).should eq(product_store_entryship)
    end
  end

  describe "GET new" do
    it "assigns a new product_store_entryship as @product_store_entryship" do
      get :new
      assigns(:product_store_entryship).should be_a_new(ProductStoreEntryship)
    end
  end

  describe "GET edit" do
    it "assigns the requested product_store_entryship as @product_store_entryship" do
      product_store_entryship = ProductStoreEntryship.create! valid_attributes
      get :edit, :id => product_store_entryship.id
      assigns(:product_store_entryship).should eq(product_store_entryship)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ProductStoreEntryship" do
        expect {
          post :create, :product_store_entryship => valid_attributes
        }.to change(ProductStoreEntryship, :count).by(1)
      end

      it "assigns a newly created product_store_entryship as @product_store_entryship" do
        post :create, :product_store_entryship => valid_attributes
        assigns(:product_store_entryship).should be_a(ProductStoreEntryship)
        assigns(:product_store_entryship).should be_persisted
      end

      it "redirects to the created product_store_entryship" do
        post :create, :product_store_entryship => valid_attributes
        response.should redirect_to(ProductStoreEntryship.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product_store_entryship as @product_store_entryship" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProductStoreEntryship.any_instance.stub(:save).and_return(false)
        post :create, :product_store_entryship => {}
        assigns(:product_store_entryship).should be_a_new(ProductStoreEntryship)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProductStoreEntryship.any_instance.stub(:save).and_return(false)
        post :create, :product_store_entryship => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested product_store_entryship" do
        product_store_entryship = ProductStoreEntryship.create! valid_attributes
        # Assuming there are no other product_store_entryships in the database, this
        # specifies that the ProductStoreEntryship created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ProductStoreEntryship.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => product_store_entryship.id, :product_store_entryship => {'these' => 'params'}
      end

      it "assigns the requested product_store_entryship as @product_store_entryship" do
        product_store_entryship = ProductStoreEntryship.create! valid_attributes
        put :update, :id => product_store_entryship.id, :product_store_entryship => valid_attributes
        assigns(:product_store_entryship).should eq(product_store_entryship)
      end

      it "redirects to the product_store_entryship" do
        product_store_entryship = ProductStoreEntryship.create! valid_attributes
        put :update, :id => product_store_entryship.id, :product_store_entryship => valid_attributes
        response.should redirect_to(product_store_entryship)
      end
    end

    describe "with invalid params" do
      it "assigns the product_store_entryship as @product_store_entryship" do
        product_store_entryship = ProductStoreEntryship.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProductStoreEntryship.any_instance.stub(:save).and_return(false)
        put :update, :id => product_store_entryship.id, :product_store_entryship => {}
        assigns(:product_store_entryship).should eq(product_store_entryship)
      end

      it "re-renders the 'edit' template" do
        product_store_entryship = ProductStoreEntryship.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProductStoreEntryship.any_instance.stub(:save).and_return(false)
        put :update, :id => product_store_entryship.id, :product_store_entryship => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested product_store_entryship" do
      product_store_entryship = ProductStoreEntryship.create! valid_attributes
      expect {
        delete :destroy, :id => product_store_entryship.id
      }.to change(ProductStoreEntryship, :count).by(-1)
    end

    it "redirects to the product_store_entryships list" do
      product_store_entryship = ProductStoreEntryship.create! valid_attributes
      delete :destroy, :id => product_store_entryship.id
      response.should redirect_to(product_store_entryships_url)
    end
  end

end
