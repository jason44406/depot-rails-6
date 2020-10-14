require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count', 1) do
      post line_items_url, params: { product_id: products(:two).id }
    end

    follow_redirect!

    # assert_select 'li', "1 \u00D7 MyString02" # escape sequence \u00D7 equivalent to 'x'
    assert_select 'h2', 'Your Cart'
    assert_select 'td', '1'
    assert_select 'td', "MyString02"

  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should remove one quantity when quantity > 1" do
    @line_item.quantity = 4
    @line_item.save
    delete line_item_url(@line_item)
    @line_item.reload
    assert_equal 3, @line_item.quantity
  end

  test "should destroy when quantity = 1" do
    @line_item.quantity = 1
    @line_item.save
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end
  end

  # test "should destroy line_item" do
  #   assert_difference('LineItem.count', -1) do
  #     delete line_item_url(@line_item)
  #   end
  #
  #   assert_redirected_to line_items_url
  # end
end
