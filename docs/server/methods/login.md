Login
===================

!!! info "Role Guest"

User authorization method

```shell title="Method <span class='color-method'>POST</span>"
/api/login
```

Body

| Key       | Description                 |
|-----------|-----------------------------|
| email     | required, email validation  |
| password  | required, min 8, max 16     |
| uniqueKey | required, unique device key |

Response example

```json title="Response <span class='color-200'>200</span>"
{
  "userId": 2,
  "token": "08/vJcV2PMsMhPCuphqh3+rRyfty844C1T54DYpcL6fFSiydysClXTaEFLmXh4U/ChFosVUitq35lOrnKkul8T0Drg/CIpO0VQMf1i0hhoI=",
  "uniqueKey": "my_device_key",
  "createAt": "2023-02-13T21:28:43.000"
}
```

Response options

| Status code                           | Description          |
|---------------------------------------|----------------------|
| <span class='color-200'>200</span>    | OK                   |
| <span class='color-error'>400</span>  | Bad Request          |
| <span class='color-error'>422</span>  | Unprocessable Entity |
| <span class='color-error'>500</span>  | Internal Error       |