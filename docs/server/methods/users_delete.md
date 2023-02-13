User Delete
===================

!!! info "Role Admin"

Delete user

```shell title="Method <span class='color-method'>DELETE</span>"
/api/users/{id}
```

Response example

```json title="Response <span class='color-200'>200</span>"
{
  "code": 200,
  "message": "User deleted successfully"
}
```

Response options

| Status code                          | Description    |
|--------------------------------------|----------------|
| <span class='color-200'>200</span>   | OK             |
| <span class='color-error'>500</span> | Internal Error |