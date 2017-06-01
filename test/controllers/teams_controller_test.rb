require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup do
    @team = teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team" do
    assert_difference('Team.count') do
      post :create, team: { champ_racer1_id: @team.champ_racer1_id, champ_racer_id: @team.champ_racer_id, country: @team.country, engine_prod: @team.engine_prod, name: @team.name, numbr1: @team.numbr1, numbr2: @team.numbr2 }
    end

    assert_redirected_to team_path(assigns(:team))
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team
    assert_response :success
  end

  test "should update team" do
    patch :update, id: @team, team: { champ_racer1_id: @team.champ_racer1_id, champ_racer_id: @team.champ_racer_id, country: @team.country, engine_prod: @team.engine_prod, name: @team.name, numbr1: @team.numbr1, numbr2: @team.numbr2 }
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

    assert_redirected_to teams_path
  end
end
