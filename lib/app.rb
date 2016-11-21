require 'line/bot'

def client
  @client ||= Line::Bot::Client.new { |config|
    config.channel_secret = ENV["e912a24372815b3127ecaaceb18580c7"]
    config.channel_token = ENV["u1KGtvWFgLEcjNEGyjNqOFRqh0+9flbZV3vP7IlJg1O1r+1cGhyTWclz5wN4fMTSmOSMn0GksJK+b3qCFXjMok4nFGzkhNMc1tTIElJyWNvIMcd1EWDd2OVOi7wom4UKZ/ehFHpE/mfn5PnBaCUWQgdB04t89/1O/w1cDnyilFU="]
  }
end

post '/callback' do
  body = request.body.read

  signature = request.env['HTTP_X_LINE_SIGNATURE']
  unless client.validate_signature(body, signature)
    error 400 do 'Bad Request' end
  end

  events = client.parse_events_from(body)
  events.each { |event|
    case event
    when Line::Bot::Event::Message
      case event.type
      when Line::Bot::Event::MessageType::Text
        message = {
          type: 'text',
          text: event.message['text']
        }
        client.reply_message(event['replyToken'], message)
      when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
        response = client.get_message_content(event.message['id'])
        tf = Tempfile.open("content")
        tf.write(response.body)
      end
    end
  }

  "OK"
end
