module TelegramBot
  class Update
    JSON.mapping({
      update_id: UInt64,
      message: { type: Message, nilable: true }
      #inline_query: { type: InlineQuery, nilable: true }
      #chosen_inline_result: { type: ChosenInlineResult, nilable: true }
      #callback_query: { type: CallbackQuery, nilable: true }
    })
  end
end
