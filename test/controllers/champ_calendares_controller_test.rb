require 'test_helper'

class ChampCalendaresControllerTest < ActionController::TestCase
  setup do
    @champ_calendare = champ_calendares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:champ_calendares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create champ_calendare" do
    assert_difference('ChampCalendare.count') do
      post :create, champ_calendare: { champ_name: @champ_calendare.champ_name, country: @champ_calendare.country, numb: @champ_calendare.numb, place: @champ_calendare.place, start_date: @champ_calendare.start_date }
    end

    assert_redirected_to champ_calendare_path(assigns(:champ_calendare))
  end

  test "should show champ_calendare" do
    get :show, id: @champ_calendare
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @champ_calendare
    assert_response :success
  end

  test "should update champ_calendare" do
    patch :update, id: @champ_calendare, champ_calendare: { champ_name: @champ_calendare.champ_name, country: @champ_calendare.country, numb: @champ_calendare.numb, place: @champ_calendare.place, start_date: @champ_calendare.start_date }
    assert_redirected_to champ_calendare_path(assigns(:champ_calendare))
  end

  test "should destroy champ_calendare" do
    assert_difference('ChampCalendare.count', -1) do
      delete :destroy, id: @champ_calendare
    end

    assert_redirected_to champ_calendares_path
  end
end
