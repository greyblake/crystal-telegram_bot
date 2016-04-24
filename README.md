# Telegram Bot

Crystal client for [Telegram's Bot API](https://core.telegram.org/bots).

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  telegram_bot:
    github: greyblake/telegram_bot
```

## Usage

The library is still in development, but you can already access basic features.

```crystal
require "telegram_bot"

TOKEN = "Token-that-Botfather-gave-you"

TelegramBot::Bot.new(TOKEN).run do |message|
  message.reply("Stop sending me '#{message.text}'!")
end
```

## License

The library is available as open source under the terms of the MIT License.

## Contributors

- [greyblake](https://github.com/greyblake) Sergey Potapov - creator, maintainer
