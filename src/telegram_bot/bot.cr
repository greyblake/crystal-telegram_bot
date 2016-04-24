module TelegramBot
  class BotMessage
    property :client
    property :message

    def initialize(client, message)
      @client = client
      @message = message
    end

    def reply(text)
      chat = message.chat as Chat
      client.send_message(chat.id, text)
      log_reply(text)
    end

    def log_reply(text)
      time = Time.now.to_s("%Y-%m-%d %H:%M:%S")
      time_part = "[#{time}]".colorize(:blue)

      username = from && (from as User).username || ""
      username_part = username.colorize.green

      direction = "->".colorize(:yellow)

      puts "#{time_part} #{username_part} #{direction} : #{text}"
    end


    # TODO: find a way to delegate these methods
    def text
      message.text
    end

    def message_id
      message.message_id
    end

    def from
      message.from
    end

    def date
      message.date
    end

    def chat
      message_id.chat
    end
  end

  class Bot
    property :client
    property :offset
    property :logger

    def initialize(client : Client)
      @client = client
      @offset = 0
    end

    def initialize(token : String)
      @client = Client.new(token)
      @offset = 0
    end

    def run
      loop do
        updates = client.get_updates(offset: @offset)
        @offset = updates.last.update_id + 1 if updates.size > 0
        updates.each do |update|
          if update.message
            bot_message = BotMessage.new(client, update.message as Message)
            log(bot_message)
            yield(bot_message)
          end
        end
        sleep 0.5
      end
    end

    def log(bot_message)
      time = Time.now.to_s("%Y-%m-%d %H:%M:%S")
      time_part = "[#{time}]".colorize(:blue)
      username = bot_message.from && (bot_message.from as User).username || ""
      username_part = username.colorize.green
      direction = "<-".colorize(:yellow)

      text = bot_message.text
      puts "#{time_part} #{username_part} #{direction} : #{text}"
    end
  end
end
