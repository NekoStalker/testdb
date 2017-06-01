require 'test_helper'

class ChampRacersControllerTest < ActionController::TestCase
  setup do
    @champ_racer = champ_racers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:champ_racers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create champ_racer" do
    assert_difference('ChampRacer.count') do
      post :create, champ_racer: { b_date: @champ_racer.b_date, country: @champ_racer.country, fn: @champ_racer.fn, sn: @champ_racer.sn, win_rate: @champ_racer.win_rate }
    end

    assert_redirected_to champ_racer_path(assigns(:champ_racer))
  end

  test "should show champ_racer" do
    get :show, id: @champ_racer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @champ_racer
    assert_response :success
  end

  test "should update champ_racer" do
    patch :update, id: @champ_racer, champ_racer: { b_date: @champ_racer.b_date, country: @champ_racer.country, fn: @champ_racer.fn, sn: @champ_racer.sn, win_rate: @champ_racer.win_rate }
    assert_redirected_to champ_racer_path(assigns(:champ_racer))
  end

  test "should destroy champ_racer" do
    assert_difference('ChampRacer.count', -1) do
      delete :destroy, id: @champ_racer
    end

    assert_redirected_to champ_racers_path
  end
end
