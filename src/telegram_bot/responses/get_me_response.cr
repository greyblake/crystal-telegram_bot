module TelegramBot
  class GetMeResponse
    JSON.mapping({
      ok: Bool,
      result: User,
    })
  end
end
