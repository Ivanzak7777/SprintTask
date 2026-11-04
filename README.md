# Спринти

Особистий трекер: місячні спринти, Odoo-звичка, ідеї для вайбкодингу, вага, капітал (EUR + USD за живим курсом ЄЦБ).
Статичний сайт на GitHub Pages, дані в Supabase.

## Налаштування (один раз)

1. **Supabase.** Створи проєкт на supabase.com. У SQL Editor запусти `supabase/schema.sql`.
2. **Auth.** Authentication → URL Configuration: у *Site URL* і *Redirect URLs* додай адресу сайту, наприклад `https://<логін>.github.io/sprints/`.
3. **Ключі.** Project Settings → API: скопіюй *Project URL* і *anon public key* у `config.js`. Впиши свою пошту в `singleUserEmail`.
4. **GitHub Pages.** Створи репозиторій, залий файли, Settings → Pages → Deploy from branch → `main` / root.
5. **Перший вхід.** Відкрий сайт, введи пошту, перейди за посиланням з листа в тому ж браузері.
6. **Перенесення даних.** У SQL Editor запусти `supabase/seed.sql` (лежить окремо, у репозиторій не потрапляє), онови сторінку.
7. **Закрий реєстрацію.** Authentication → Sign In / Providers → вимкни *Allow new users to sign up*.

## Структура

- `index.html` — уся сторінка: розмітка, стилі, логіка.
- `config.js` — URL і публічний ключ Supabase.
- `supabase/schema.sql` — таблиця `docs` і RLS-політика «бачиш лише свої рядки».

Дані лежать у таблиці `docs` як `(col, id, data)`: `sprints`, `goals`, `capital`, `weight`, `ideas`, `habits/odoo`, `meta/plan`.
Сторінка підтягує свіжі дані щоразу, коли повертаєшся на вкладку, тож телефон і ноут синхронізуються.

## Курс USD → EUR

При натисканні «Записати» сторінка бере курс з api.frankfurter.dev (дані ЄЦБ), запасні варіанти — frankfurter.app і open.er-api.com.
Якщо всі недоступні, можна вписати курс вручну.
