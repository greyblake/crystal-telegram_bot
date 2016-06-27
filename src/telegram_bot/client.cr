module TelegramBot
  class Client
    HOST = "api.telegram.org"
    TIMEOUT = 3

    def initialize(token : String)
      @token = token
      @http_client = HTTP::Client.new(HOST, tls: true)
      @http_client.connect_timeout = TIMEOUT
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

    def send_message(chat_id, text)
      http_response = call("sendMessage", {
         "chat_id" => chat_id.to_s,
         "text" => text,
         "parse_mode" => "HTML"
      })
      JSON.parse(http_response.body)
    end

    private def call(method_name, params = {} of String => String) : HTTP::Client::Response
      path = "/bot#{@token}/#{method_name}"
      @http_client.post_form(path, params)
    end
  end
end
