source("telegram_lib.R")
source("config.R")

Sys.setlocale("LC_ALL", "Ru_Ru")



# Setup my bot

bot <- TGBot$new(token = bot_token)
bot$getMe()
bot$set_default_chat_id(default_chat_id)

# Отправляем тестовое сообщение

bot$sendMessage (text='Это тестовое сообщение', 
                 parse_mode = 'markdown', 
                 reply_markup='{
                 "inline_keyboard": [
                 [
                 {
                 "text": "Some button text 1",
                 "callback_data": "1"
                 }
                 ],
                 [
                 {
                 "text": "Some button text 2",
                 "callback_data": "2"
                 }
                 ],
                 [
                 {
                 "text": "Some button text 3",
                 "callback_data": "3"
                 }
                 ]
                 ]
                 }',
                 chat_id=default_chat_id)

# Получаем апдейты

offset <- NULL
updates <- bot$getUpdates(offset=offset)
