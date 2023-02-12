Login
===================

User authorization method

```shell title="Method <span class='color-method'>POST</span>"
/api/login
```

Response example

```json title="Response <span class='color-200'>200</span>"
{
    "id": 1,
    "email": "user@gmail.com",
    "token": "ODhzZHU4OXNmOGRmODlzOGRmOHM5ZHVmODlzOThkZjg5czk4ZGY4OXNkOWZzODlkZg=="
}
```

Response options

| Status code                            | Description    |
|----------------------------------------|----------------|
| <span class='color-200'>200</span>     | OK             |
| <span class='color-error'>400</span>   | Bad Request    |
| <span class='color-error'>500</span>   | Internal Error |