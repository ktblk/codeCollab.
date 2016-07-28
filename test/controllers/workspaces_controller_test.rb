require 'test_helper'

class WorkspacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workspaces_index_url
    assert_response :success
  end

  test "should get create" do
    get workspaces_create_url
    assert_response :success
  end

  test "should get delete" do
    get workspaces_delete_url
    assert_response :success
  end

  test "should get edit" do
    get workspaces_edit_url
    assert_response :success
  end

end
