require 'test_helper'

class WordcardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wordcard = wordcards(:one)
  end

  test "should get index" do
    get wordcards_url
    assert_response :success
  end

  test "should get new" do
    get new_wordcard_url
    assert_response :success
  end

  test "should create wordcard" do
    assert_difference('Wordcard.count') do
      post wordcards_url, params: { wordcard: {  } }
    end

    assert_redirected_to wordcard_url(Wordcard.last)
  end

  test "should show wordcard" do
    get wordcard_url(@wordcard)
    assert_response :success
  end

  test "should get edit" do
    get edit_wordcard_url(@wordcard)
    assert_response :success
  end

  test "should update wordcard" do
    patch wordcard_url(@wordcard), params: { wordcard: {  } }
    assert_redirected_to wordcard_url(@wordcard)
  end

  test "should destroy wordcard" do
    assert_difference('Wordcard.count', -1) do
      delete wordcard_url(@wordcard)
    end

    assert_redirected_to wordcards_url
  end
end
