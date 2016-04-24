module TelegramBot
  class Client
    API_URL = "https://api.telegram.org"

    def initialize(token)
      @token = token
    end

    def get_me : User
      http_response = call("getMe")
      response = GetMeResponse.from_json(http_response.body)
      response.result
    end

    def get_updates(offset = nil, limit = nil, timeout = nil) : Array(Update)
      http_response = call("getUpdates", {
        "offset" => offset.to_s,
        "limit" => limit.to_s,
        "timeout" => timeout.to_s
      })
      response = GetUpdatesResponse.from_json(http_response.body)
      response.result
    end

    def send_message(chat_id, text, disable_web_page_preview = false, reply_to_message_id = nil, reply_markup = nil)
      http_response = call("sendMessage", {
         "chat_id" => chat_id.to_s,
         "text" => text
      })
      JSON.parse(http_response.body)
    end

    private def call(method_name, params = {} of String => String) : HTTP::Client::Response
      url = "#{API_URL}/bot#{@token}/#{method_name}"
      HTTP::Client.post_form(url, params)
    end
  end
end
