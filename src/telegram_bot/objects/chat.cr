module TelegramBot
  class Chat
    JSON.mapping({
      id: UInt64,
      type: String,  #  “private”, “group”, “supergroup” or “channel”
      last_name: { type: String, nilable: true },
      username: { type: String, nilable: true },
      first_name: { type: String, nilable: true },
      last_name: { type: String, nilable: true },
    })
  end
end
