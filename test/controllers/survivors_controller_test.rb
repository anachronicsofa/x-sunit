require 'test_helper'

class SurvivorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survivor = survivors(:one)
  end

  test 'should get index' do
    get api_v1_survivors_path, as: :json
    assert_response :success
  end

  test 'should create survivor' do
    assert_difference('Survivor.count') do
      post api_v1_survivors_path, params: { survivor: { abducted: @survivor.abducted,
                                                        birthdate: @survivor.birthdate,
                                                        gender: @survivor.gender, latitude: @survivor.latitude,
                                                        longitude: @survivor.longitude, name: @survivor.name,
                                                        reports_received: @survivor.reports_received } }, as: :json
    end
    assert_response 201
  end

  test 'should not save survivor without arguments' do
    survivor = Survivor.new
    assert_not survivor.save
  end

  test 'should save survivor without reports received and abducted status' do
    post api_v1_survivors_path, params: { survivor: { abducted: @survivor.abducted,
                                                      birthdate: @survivor.birthdate,
                                                      gender: @survivor.gender, latitude: @survivor.latitude,
                                                      longitude: @survivor.longitude, name: @survivor.name } }, as: :json
    assert_response 201
  end

  test 'should show survivor' do
    get api_v1_survivor_path(@survivor), as: :json
    assert_response :success
  end

  test 'should update survivor' do
    patch api_v1_survivor_path(@survivor), params: { survivor: { abducted: @survivor.abducted, birthdate: @survivor.birthdate, gender: @survivor.gender, latitude: @survivor.latitude, longitude: @survivor.longitude, name: @survivor.name, reports_received: @survivor.reports_received } }, as: :json
    assert_response 200
  end

  test 'should destroy survivor' do
    assert_difference('Survivor.count', -1) do
      delete api_v1_survivor_path(@survivor), as: :json
    end
    assert_response 204
  end

  test 'report abducted survivors percentage' do
    get percentage_of_abducted_api_v1_survivors_path, as: :json
    assert_response :success
  end

  test 'report non abducted survivors percentage' do
    get percentage_of_non_abducted_api_v1_survivors_path, as: :json
    assert_response :success
  end

  test 'show survivors in alphabetic order' do
    get show_alphabetic_order_api_v1_survivors_path, as: :json
    assert_response :success
  end
end
