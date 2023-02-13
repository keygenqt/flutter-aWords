Logout
===================

!!! info "Roles User|Admin"

Removing an authorization token from the server

```shell title="Method <span class='color-method'>DELETE</span>"
/api/logout
```

Response example

```json title="Response <span class='color-200'>200</span>"
{
  "code": 200,
  "message": "Token deleted successfully"
}
```

Response options

| Status code                            | Description    |
|----------------------------------------|----------------|
| <span class='color-200'>200</span>     | OK             |
| <span class='color-error'>404</span>   | NotFound       |