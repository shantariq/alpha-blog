require 'test_helper'



class ListCategoriesTest < ActionDispatch::IntegrationTest
     def setup
        @category = Category.new(name: "books")
       @category2 = Category.new(name: "programming")
   end

       test " Should show Categories list" do 

         get categories_path
         assert_template 'categories/index'
         assert_select "a[href=?]", category_path(@category), text: @category.name
         assert_select "a[href=?]", category_path(@category2), text: @category.name




     end


end