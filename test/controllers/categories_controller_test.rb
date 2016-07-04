require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

	def setup
		@category = Category.create(name: "sports")
		@user = User.create(username: "shah", email: "shah@gmail.com", password: "shah", admin: true)

	end


	test "should get categories index" do 

		get :index
		assert_response :success
	end

	test "should get new" do 
		session[:user_id]= @user.id
		#in controller we can directly use session
		
		get :new
		assert_response :success

	end
     
     test "should get show" do  
     	get(:show, {'id' =>  @category.id}) 
     	assert_response :success

    end

    test "should redirect to create when admin in not logged in" do
    	assert_no_difference  'Category.count' do
    	post :create, category: {name: "sports"}	


    	end

    	assert_redirected_to categories_path
    	end


end