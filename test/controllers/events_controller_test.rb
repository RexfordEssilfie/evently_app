require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = Event.first
    @user = User.first
  end

  test "should get index" do
    get events_path
    assert_response :success
  end

  test "should get new" do
    get new_event_path
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_path, params: { event: {email: @user.email, password: "foobar", description: @event.description, end_time: @event.end_time, name: @event.name, start_time: @event.start_time, visibility: @event.visibility, location: @event.location } }
    end

    assert_redirected_to event_path(Event.last)
  end

  test "should show event" do
    get event_path(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_path(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_path(@event), params: { event: { description: @event.description, end_time: @event.end_time, name: @event.name, start_time: @event.start_time, visibility: @event.visibility } }
    assert_redirected_to event_path(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_path(@event)
    end

    assert_redirected_to events_path
  end
end
