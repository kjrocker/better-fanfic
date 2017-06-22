require 'test_helper'

module V1
  class ChaptersControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = create(:user)
      @chapter = create(:chapter, user: @user)
    end

    test "should get index" do
      get chapters_url, as: :json
      assert_response :success
    end

    test "should create chapter" do
      assert_difference('Chapter.count') do
        post chapters_url, params: { chapter: attributes_for(:chapter, user: @user) }, headers: authenticated_header(@user), as: :json
      end

      assert_response 201
    end

    test "should show chapter" do
      get chapter_url(@chapter), as: :json
      assert_response :success
    end

    test "should update chapter" do
      patch chapter_url(@chapter), params: { chapter: attributes_for(:chapter) },
        headers: authenticated_header(@user), as: :json
      assert_response 200
    end

    test "should destroy chapter" do
      assert_difference('Chapter.count', -1) do
        delete chapter_url(@chapter), headers: authenticated_header(@user), as: :json
      end

      assert_response 204
    end
  end
end
