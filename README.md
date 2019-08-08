# README

Testing task for MassMedia Group
#Ruby 2.4.2 | Rails 5.1.7 | Postgresql 10.5

#[Travis](https://travis-ci.org/valeragh/mass_media_blog)  test - https://travis-ci.org/valeragh/mass_media_blog

## Gems
* haml-rails - люблю использовать haml
* bootstrap - практически всегда использую для фронта
* simple_form - для форм
* carrierwave - для загрузки изображений
* mini_magick - для кадрирования изображений

## Gams для логов
* better_errors - удобное отображение логов;

## Gems для тестирования
* rspec-rails - практически всегда использую, с mini-test почти не работаю
* factory_bot_rails - для создания экземпляров моделей
* capybara - для имитация пользователя
* database_cleaner - чистка базы после тестов

## Gems которые бы добавил
* annotate - обычно добавляю для удобства разработки
* kaminari - для пагинации постов
* enumerize - для удобного выбора категорий списком, а не через чекбоксы
* dalli - для кеширования на уровне коллекций
* friendly_id - для читабельных slug-ов

## Тестирование
* Тестами покрыты модели
* Тестами покрыты контролеры
* Тестами покрыты пользовательские сценарии
* Travis - выдает ошибку создания базы, не смог пофиксить, как понимаю нудну рестартнуть базу перед созданием
