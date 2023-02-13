User List
===================

!!! info "Roles Guest | User | Admin"

Get a list of users

```shell title="Method <span class='color-method'>GET</span>"
/api/users
```

Response example

```json title="Response <span class='color-200'>200</span>"
[
  {
    "id": 1,
    "name": "Оля",
    "email": "best1@email.com",
    "role": "admin"
  },
  {
    "id": 2,
    "name": "Юля",
    "email": "best2@email.com",
    "role": "user"
  }
]
```

Response options

| Status code                          | Description    |
|--------------------------------------|----------------|
| <span class='color-200'>200</span>   | OK             |
| <span class='color-error'>500</span> | Internal Error |