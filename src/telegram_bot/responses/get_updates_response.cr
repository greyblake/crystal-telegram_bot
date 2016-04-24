module TelegramBot
  class GetUpdatesResponse
    JSON.mapping({
      ok: Bool,
      result: Array(Update)
    })
  end
end
