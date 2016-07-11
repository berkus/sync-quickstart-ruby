##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

require 'spec_helper.rb'

describe 'Notification' do
  it "can create" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))
    
    expect {
      @client.notifications.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .notifications.create()
    }.to raise_exception(Twilio::REST::TwilioException)
    
    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://notifications.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Notifications',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        201,
      %q[
      {
          "sid": "NOb8021351170b4e1286adaac3fdd6d082",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "IS699b53e02da45a1ba9d13b7d7d2766af",
          "date_created": "2016-03-24T23:42:28Z",
          "identities": [
              "jing"
          ],
          "tags": [],
          "priority": "high",
          "ttl": 2419200,
          "title": "test",
          "body": "body",
          "sound": null,
          "action": null,
          "data": null,
          "apn": null,
          "gcm": null
      }
      ]
    ))
    
    actual = @client.notifications.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                     .notifications.create()
    
    expect(actual).to_not eq(nil)
  end
end