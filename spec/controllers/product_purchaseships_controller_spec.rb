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

describe ProductPurchaseshipsController do

  # This should return the minimal set of attributes required to create a valid
  # ProductPurchaseship. As you add validations to ProductPurchaseship, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all product_purchaseships as @product_purchaseships" do
      product_purchaseship = ProductPurchaseship.create! valid_attributes
      get :index
      assigns(:product_purchaseships).should eq([product_purchaseship])
    end
  end

  describe "GET show" do
    it "assigns the requested product_purchaseship as @product_purchaseship" do
      product_purchaseship = ProductPurchaseship.create! valid_attributes
      get :show, :id => product_purchaseship.id
      assigns(:product_purchaseship).should eq(product_purchaseship)
    end
  end

  describe "GET new" do
    it "assigns a new product_purchaseship as @product_purchaseship" do
      get :new
      assigns(:product_purchaseship).should be_a_new(ProductPurchaseship)
    end
  end

  describe "GET edit" do
    it "assigns the requested product_purchaseship as @product_purchaseship" do
      product_purchaseship = ProductPurchaseship.create! valid_attributes
      get :edit, :id => product_purchaseship.id
      assigns(:product_purchaseship).should eq(product_purchaseship)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ProductPurchaseship" do
        expect {
          post :create, :product_purchaseship => valid_attributes
        }.to change(ProductPurchaseship, :count).by(1)
      end

      it "assigns a newly created product_purchaseship as @product_purchaseship" do
        post :create, :product_purchaseship => valid_attributes
        assigns(:product_purchaseship).should be_a(ProductPurchaseship)
        assigns(:product_purchaseship).should be_persisted
      end

      it "redirects to the created product_purchaseship" do
        post :create, :product_purchaseship => valid_attributes
        response.should redirect_to(ProductPurchaseship.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product_purchaseship as @product_purchaseship" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProductPurchaseship.any_instance.stub(:save).and_return(false)
        post :create, :product_purchaseship => {}
        assigns(:product_purchaseship).should be_a_new(ProductPurchaseship)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProductPurchaseship.any_instance.stub(:save).and_return(false)
        post :create, :product_purchaseship => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested product_purchaseship" do
        product_purchaseship = ProductPurchaseship.create! valid_attributes
        # Assuming there are no other product_purchaseships in the database, this
        # specifies that the ProductPurchaseship created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ProductPurchaseship.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => product_purchaseship.id, :product_purchaseship => {'these' => 'params'}
      end

      it "assigns the requested product_purchaseship as @product_purchaseship" do
        product_purchaseship = ProductPurchaseship.create! valid_attributes
        put :update, :id => product_purchaseship.id, :product_purchaseship => valid_attributes
        assigns(:product_purchaseship).should eq(product_purchaseship)
      end

      it "redirects to the product_purchaseship" do
        product_purchaseship = ProductPurchaseship.create! valid_attributes
        put :update, :id => product_purchaseship.id, :product_purchaseship => valid_attributes
        response.should redirect_to(product_purchaseship)
      end
    end

    describe "with invalid params" do
      it "assigns the product_purchaseship as @product_purchaseship" do
        product_purchaseship = ProductPurchaseship.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProductPurchaseship.any_instance.stub(:save).and_return(false)
        put :update, :id => product_purchaseship.id, :product_purchaseship => {}
        assigns(:product_purchaseship).should eq(product_purchaseship)
      end

      it "re-renders the 'edit' template" do
        product_purchaseship = ProductPurchaseship.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProductPurchaseship.any_instance.stub(:save).and_return(false)
        put :update, :id => product_purchaseship.id, :product_purchaseship => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested product_purchaseship" do
      product_purchaseship = ProductPurchaseship.create! valid_attributes
      expect {
        delete :destroy, :id => product_purchaseship.id
      }.to change(ProductPurchaseship, :count).by(-1)
    end

    it "redirects to the product_purchaseships list" do
      product_purchaseship = ProductPurchaseship.create! valid_attributes
      delete :destroy, :id => product_purchaseship.id
      response.should redirect_to(product_purchaseships_url)
    end
  end

end
