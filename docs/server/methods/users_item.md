User Item
===================

Get user details

```shell title="Method <span class='color-method'>GET</span>"
/api/users/{id}
```

Response example

```json title="Response <span class='color-200'>200</span>"
{
  "id": 1,
  "name": "Оля",
  "email": "best1@email.com",
  "role": "admin"
}
```

Response options

| Status code                          | Description    |
|--------------------------------------|----------------|
| <span class='color-200'>200</span>   | OK             |
| <span class='color-error'>400</span> | Bad Request    |
| <span class='color-error'>401</span> | Unauthorized   |
| <span class='color-error'>403</span> | Forbidden      |
| <span class='color-error'>404</span> | NotFound       |
| <span class='color-error'>500</span> | Internal Error |