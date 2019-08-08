require 'rails_helper'

RSpec.describe CategoryPostsController, type: :controller do

  let!(:category_post) { create(:category_post) }
  let(:valid_attributes) do
    FactoryBot.attributes_for :category_post
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for :invalid_category_post
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
      expect(response.body).to eq ""
    end

    it "assigns the requested category_posts to @category_posts" do
      get :index
      expect(assigns(:category_posts)).to eq(CategoryPost.all)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: category_post }
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, params: { id: category_post }
      expect(response).to render_template("show")
      expect(response.body).to eq ""
    end

    it "assigns the requested category_post to @category_post" do
      get :show, params: { id: category_post }
      expect(assigns(:category_post)).to eq(category_post)
    end
  end

  describe "GET #edit" do
    it 'returns http success' do
      get :edit, params: { id: category_post }
      expect(response).to have_http_status(:success)
    end

    it 'assigns the category_post' do
      get :edit, params: { id: category_post }
      expect(assigns(:category_post)).to eq(category_post)
    end
  end

  describe "PUT update" do
    context "with valid attributes" do
      it 'assigns the category_post' do
        put :update, params: { id: category_post, :category_post => valid_attributes }
        expect(assigns(:category_post)).to eq(category_post)
      end
      it 'returns http redirect' do
        put :update, params: { id: category_post, :category_post => valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(category_post_path(category_post))
      end
      it "should update the category_post" do
        put :update, params: { id: category_post, :category_post => valid_attributes }
        category_post.reload
        expect(category_post.name).to  eq(valid_attributes[:name])
        expect(category_post.description).to  eq(valid_attributes[:description])
      end
    end
    
    context "with invalid attributes" do
      it 'does not change category_post' do
        expect do
          put :update, params: { id: category_post, :category_post => invalid_attributes }
        end.not_to change { category_post.reload.name }
      end
    end 
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new CategoryPost to @category_post' do
      get :new
      expect(assigns(:category_post)).to be_a_new(CategoryPost)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new category_post" do
        expect{
          post :create, params: { category_post: valid_attributes  } 
        }.to change(CategoryPost, :count).by(1)
      end
      
      it "redirects to the new category_post" do
        post :create, params: { :category_post => valid_attributes }
        expect(response).to redirect_to category_post_url(CategoryPost.last)
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new category_post" do
        expect{
          post :create, params: { :category_post => invalid_attributes }
        }.to_not change(CategoryPost, :count)
      end
      
      it "re-renders the new method" do
        post :create, params: { :category_post => invalid_attributes }
        expect(response).to render_template :new
      end
    end 
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      expect {
        delete :destroy, params: { id: category_post.id }
      }.to change(CategoryPost, :count).by(-1)
    end

    it "redirects to the field" do
      delete :destroy, params: { id: category_post.id } 
      expect(response).to redirect_to(category_posts_path)
    end
  end

end
