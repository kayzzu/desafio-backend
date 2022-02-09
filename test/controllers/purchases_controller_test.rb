require "test_helper"

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase = purchases(:one)
  end

  test "should get index" do
    get purchases_url, as: :json
    assert_response :success
  end

  test "should create purchase" do
    assert_difference("Purchase.count") do
      post purchases_url, params: { purchase: { card: @purchase.card, date: @purchase.date, document: @purchase.document, store_name: @purchase.store_name, store_owner: @purchase.store_owner, time: @purchase.time, type: @purchase.type, value: @purchase.value } }, as: :json
    end

    assert_response :created
  end

  test "should show purchase" do
    get purchase_url(@purchase), as: :json
    assert_response :success
  end

  test "should update purchase" do
    patch purchase_url(@purchase), params: { purchase: { card: @purchase.card, date: @purchase.date, document: @purchase.document, store_name: @purchase.store_name, store_owner: @purchase.store_owner, time: @purchase.time, type: @purchase.type, value: @purchase.value } }, as: :json
    assert_response :success
  end

  test "should destroy purchase" do
    assert_difference("Purchase.count", -1) do
      delete purchase_url(@purchase), as: :json
    end

    assert_response :no_content
  end
end
