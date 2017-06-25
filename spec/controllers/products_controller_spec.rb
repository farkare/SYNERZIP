require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
	describe "GET index" do
	    it "assigns @products" do
	      product = create(:pen)
	      get :index
	      expect(assigns(:products)).to eq([product])
	    end

	    it "renders the index template" do
	      get :index
	      expect(response).to render_template("index")
	    end

	    describe "GET #show" do
			it "assigns the requested product to @product" do
				product = create(:pen)
				get :show, id: product
				assigns(:product).should eq(product)
			end

			it "renders the #show view" do
				get :show, id: create(:product)
				response.should render_template :show
			end
		end

		describe "GET #new" do
			it "assigns a new Product to @product" do 
				get :new 
				assigns(:product).type.should eq nil
			end
			it "renders the :new template" do 
				get :new 
				response.should render_template :new
			end
		end

		describe "POST #create" do
			context "with valid attributes" do
			  	it "creates a new product" do
					expect{
						post :create, product: attributes_for(:product)
					}.to change(Product,:count).by(1)
				end
			  	it "redirects to the new product" do
			      post :create, product: attributes_for(:product)
			      response.should redirect_to Product.last
			    end
			end

			context "with invalid attributes" do
				it "does not save the new product" do
					expect{
						post :create, product: attributes_for(:invalid_product)
					}.to_not change(Product,:count)
				end

				it "re-renders the new method" do
					post :create, product: attributes_for(:invalid_product)
					response.should render_template :new
				end
			end
		end

		describe 'PUT update' do
		  before :each do
		    @product = create(:pen)
		  end
		  
		  context "valid attributes" do
		    it "located the requested @product" do
		      put :update, id: @product, product: attributes_for(:product)
		      assigns(:product).should eq(@product)      
		    end
		  
		    it "changes @product's attributes" do
		      put :update, id: @product, product: attributes_for(:product, name: 'P20', price: 500)
		      @product.reload
		      @product.name.should eq("P20")
		      @product.price.should eq(500)
		    end
		  
		    it "redirects to the updated product" do
		      put :update, id: @product, product: attributes_for(:product)
		      response.should redirect_to @product
		    end
		  end
		  
		  context "invalid attributes" do
		    it "locates the requested @product" do
		      put :update, id: @product, product: attributes_for(:invalid_product)
		      assigns(:product).should eq(@product)      
		    end
		    
		    it "does not change @product's attributes" do
		      put :update, id: @product, product: attributes_for(:product, name: "P50", price: nil)
		      @product.reload
		      @product.name.should_not eq("P50")
		      @product.price.should eq(450)
		    end
		    
		    it "re-renders the edit method" do
		      put :update, id: @product, product: attributes_for(:invalid_product)
		      response.should render_template :edit
		    end
		  end
		end

		describe 'DELETE destroy' do
		  before :each do
		    @product = create(:pen)
		  end
		  
		  it "deletes the product" do
		    expect{
		      delete :destroy, id: @product        
		    }.to change(Product,:count).by(-1)
		  end
		    
		  it "redirects to products#index" do
		    delete :destroy, id: @product
		    response.should redirect_to products_url
		  end
		end
  	end
end
