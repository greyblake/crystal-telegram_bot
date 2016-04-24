module TelegramBot
  class Message
    JSON.mapping({
      message_id: UInt64,
      from: { type: User, nilable: true },
      date: UInt64,
      chat: Chat,
      text: { type: String, nilable: true },
      forward_from: { type: User, nilable: true }
      # TODO:
      # Complete the structure: https://core.telegram.org/bots/api#message
    })
  end
end
