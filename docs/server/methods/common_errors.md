Errors
===================

All variants of errors processed by the server.

Response examples

```json title="Error <span class='color-error'>400</span>"
{
    "code": 400,
    "message": "Bad Request"
}
```

```json title="Error <span class='color-error'>401</span>"
{
    "code": 401,
    "message": "Unauthorized"
}
```

```json title="Error <span class='color-error'>403</span>"
{
    "code": 403,
    "message": "Forbidden"
}
```

```json title="Error <span class='color-error'>404</span>"
{
    "code": 404,
    "message": "Not Found"
}
```

```json title="Error <span class='color-error'>405</span>"
{
    "code": 405,
    "message": "Method Not Allowed"
}
```

```json title="Error <span class='color-error'>422</span>"
{
  "code": 422,
  "message": "Unprocessable Entity",
  "validates": [
    {
      "field": "email",
      "message": "Email is not match"
    }
  ]
}
```

```json title="Error <span class='color-error'>500</span>"
{
    "code": 500,
    "message": "{message}"
}
```

Response options

| Status code                          | Description          |
|--------------------------------------|----------------------|
| <span class='color-200'>200</span>   | OK                   |
| <span class='color-error'>400</span> | Bad Request          |
| <span class='color-error'>401</span> | Unauthorized         |
| <span class='color-error'>403</span> | Forbidden            |
| <span class='color-error'>404</span> | NotFound             |
| <span class='color-error'>405</span> | Method Not Allowed   |
| <span class='color-error'>422</span> | Unprocessable Entity |
| <span class='color-error'>500</span> | Internal Error       |