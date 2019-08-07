require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let!(:category) { create(:category) }
  let(:valid_attributes) do
    FactoryBot.attributes_for :category
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for :invalid_category
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :index
      expect(response).to render_template("index")
      expect(response.body).to eq ""
    end

    it "assigns the requested categories to @categories" do
      get :index
      expect(assigns(:categories)).to eq(Category.all)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: category }
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, params: { id: category }
      expect(response).to render_template("show")
      expect(response.body).to eq ""
    end

    it "assigns the requested category to @category" do
      get :show, params: { id: category }
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new Category to @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new category" do
        expect{
          post :create, params: { category: valid_attributes } 
        }.to change(Category, :count).by(1)
      end
      
      it "redirects to the new category" do
        post :create, params: { category: valid_attributes }
        expect(response).to redirect_to category_url(Category.last)
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new category" do
        expect{
          post :create, params: { category: invalid_attributes }
        }.to_not change(Category, :count)
      end
      
      it "re-renders the new method" do
        post :create, params: { category: invalid_attributes }
        expect(response).to render_template :new
      end
    end 
  end

  describe "GET edit" do
    it 'returns http success' do
      get :edit, params: { id: category }
      expect(response).to have_http_status(:success)
    end
    it 'assigns the category' do
      get :edit, params: { id: category }
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "PUT update" do
    context "with valid attributes" do
      it 'assigns the category' do
        put :update, params: { id: category, :category => valid_attributes }
        expect(assigns(:category)).to eq(category)
      end
      it 'returns http redirect' do
        put :update, params: { id: category, :category => valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(category_path(category))
      end
      it "should update the category" do
        put :update, params: { id: category, :category => valid_attributes }
        category.reload
        expect(category.name).to  eq(valid_attributes[:name])
        expect(category.description).to  eq(valid_attributes[:description])
      end
    end
    
    context "with invalid attributes" do
      it 'does not change category' do
        expect do
          put :update, params: { id: category, :category => invalid_attributes }
        end.not_to change { category.reload.name }
      end
    end 
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      expect {
        delete :destroy, params: { id: category.id }
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the field" do
      delete :destroy, params: { id: category.id } 
      expect(response).to redirect_to(categories_path)
    end
  end

end
