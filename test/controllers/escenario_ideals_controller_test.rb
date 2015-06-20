require 'test_helper'

class EscenarioIdealsControllerTest < ActionController::TestCase
  setup do
    @escenario_ideal = escenario_ideals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:escenario_ideals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create escenario_ideal" do
    assert_difference('EscenarioIdeal.count') do
      post :create, escenario_ideal: { descipcion: @escenario_ideal.descipcion, dificultad: @escenario_ideal.dificultad, mv_array: @escenario_ideal.mv_array, nombre: @escenario_ideal.nombre, script_maquinas: @escenario_ideal.script_maquinas }
    end

    assert_redirected_to escenario_ideal_path(assigns(:escenario_ideal))
  end

  test "should show escenario_ideal" do
    get :show, id: @escenario_ideal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @escenario_ideal
    assert_response :success
  end

  test "should update escenario_ideal" do
    patch :update, id: @escenario_ideal, escenario_ideal: { descipcion: @escenario_ideal.descipcion, dificultad: @escenario_ideal.dificultad, mv_array: @escenario_ideal.mv_array, nombre: @escenario_ideal.nombre, script_maquinas: @escenario_ideal.script_maquinas }
    assert_redirected_to escenario_ideal_path(assigns(:escenario_ideal))
  end

  test "should destroy escenario_ideal" do
    assert_difference('EscenarioIdeal.count', -1) do
      delete :destroy, id: @escenario_ideal
    end

    assert_redirected_to escenario_ideals_path
  end
end
