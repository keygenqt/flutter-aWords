User Create
===================

!!! info "Role Admin"

Add user

```shell title="Method <span class='color-method'>POST</span>"
/api/users
```

Body

| Key       | Description                 |
|-----------|-----------------------------|
| name      | required                    |
| email     | required, email validation  |
| password  | required, min 8, max 16     |
| uniqueKey | required, unique device key |

Response example

```json title="Response <span class='color-200'>200</span>"
{
  "id": 5,
  "name": "name",
  "email": "best10@email.com",
  "role": "user"
}
```

Response options

| Status code                          | Description    |
|--------------------------------------|----------------|
| <span class='color-200'>200</span>   | OK             |
| <span class='color-error'>500</span> | Internal Error |