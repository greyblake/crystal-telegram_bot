module TelegramBot
  class User
    JSON.mapping({
      id: UInt64,
      username: String,
      first_name: { type: String, nilable: true },
      last_name: { type: String, nilable: true },
    })
  end
end
