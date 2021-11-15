require "test_helper"

class SlackReservationsControllerTest < ActionDispatch::IntegrationTest
  test 'should cancel' do
    post '/book_slack', params: {text: 'cancel' }
    json_response = JSON.parse(response.body)
    assert_equal 'You don\'t have a reservation', json_response['text']
  end

  test 'should respod with confirmation' do
    post '/book_slack', params: { text: 'book' }
    json_response = JSON.parse(response.body)
    assert_equal 'Your reservation has been made', json_response['text']
  end

  test 'should respond with name or no reservation message' do
    post '/book_slack', params: { text: 'who' }
    json_response = JSON.parse(response.body)
    assert_match /[(There is no reservation)(This spot is booked .*)]/, json_response['text']
  end

  test 'should response with error' do
    post '/book_slack', params: {}
    json_response = JSON.parse(response.body)
    assert_equal 'Try other command', json_response['text']
  end
end
