require 'test_helper'

class CollectionsControllerTest < ActionController::TestCase


  setup do
    @collection = collections(:one)
    @user = users(:michael)
  end


  #test "should redirect collections index when not logged in" do
  #  get :index
  #  assert_redirected_to login_url
  #end


  test "should redirect collection edit when not logged in" do
    get :edit, id: @collection
    assert_redirected_to login_url
  end

  test "should redirect collection update when not logged in" do
    patch :update, id: @collection, venue: { name: @collection.name + '-e' }
    assert_redirected_to login_url
  end


  test "should GET collections index page" do
    log_in_as(@user)
    get :index
    assert_response :success
    assert_not_nil assigns(:collections)
  end


  test "should GET collection show page" do
    log_in_as(@user)
    get :show, id: @collection
    assert_response :success
    assert_not_nil assigns(:collection)
  end


  test "should GET new collection page" do
    log_in_as(@user)
    get :new
    assert_response :success
  end


  test "should GET edit collection page" do
    log_in_as(@user)
    get :edit, id: @collection
    assert_response :success
  end


  test "should update collection with PATCH" do
    log_in_as(@user)
    patch :update, id: @collection, collection: { name: @collection.name + '-e' }
    assert_redirected_to @collections
  end


  test "should create collection with POST" do
    log_in_as(@user)
    assert_difference('Collection.count') do
      post :create, collection: { name: @collection.name + '-new'}
    end

    assert_redirected_to collections_path
  end


  test "should DELETE collection" do
    log_in_as(@user)
    assert_difference('Collection.count', -1) do
      delete :destroy, id: @collection
    end
    assert_redirected_to collections_path
  end


end
