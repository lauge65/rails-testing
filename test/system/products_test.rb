require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "george fixture exists" do
    assert users(:george).present?
    assert_equal "george@abitbol.com", users(:george).email
  end

  test "visiting the homepage" do
   #setup
   #nothing to setup
    #exercice
    visit root_url

    #verify
    assert_selector "h1", text: "Awesome Products"

    #teardown
  end

  test "lets a signed in user create a new product" do
    login_as users(:george), scope: :user
    visit new_product_path

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"

    click_button "Create Product"

    assert_current_path root_path
    assert_text "Change your life: Learn to code"
  end

end
