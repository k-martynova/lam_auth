## Установка

```ruby
gem 'lam_auth'
```

После установки:

```sh
rails generate lam_auth
```

после этого нужно поправить настройки приложения в `config/lam_auth.yml`.

## Подключение

Подключить js-код в head:

```haml
= lam_auth_include_tag
```

Затем:

```haml
#lam-root
= lam_auth_init_tag
```

Примеры для модели/контроллера лежат в `examples`.
