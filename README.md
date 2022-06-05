# @timmedia/capacitor-strava-auth

Use the Strava authentication API in your capacitor app.

## Install

```bash
npm install @timmedia/capacitor-strava-auth
npx cap sync
```

## API

<docgen-index>

* [`authorize(...)`](#authorize)
* [Interfaces](#interfaces)
* [Enums](#enums)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### authorize(...)

```typescript
authorize(options: StravaAuthOptions) => Promise<void>
```

| Param         | Type                                                            |
| ------------- | --------------------------------------------------------------- |
| **`options`** | <code><a href="#stravaauthoptions">StravaAuthOptions</a></code> |

--------------------


### Interfaces


#### StravaAuthOptions

| Prop                 | Type                                                        |
| -------------------- | ----------------------------------------------------------- |
| **`clientId`**       | <code>string</code>                                         |
| **`redirectUri`**    | <code>string</code>                                         |
| **`responseType`**   | <code>'code'</code>                                         |
| **`approvalPrompt`** | <code>'force' \| 'auto'</code>                              |
| **`scope`**          | <code><a href="#stravaauthscope">StravaAuthScope</a></code> |
| **`state`**          | <code>string</code>                                         |


### Enums


#### StravaAuthScope

| Members                 | Value                            |
| ----------------------- | -------------------------------- |
| **`READ`**              | <code>'read'</code>              |
| **`READ_ALL`**          | <code>'read_all'</code>          |
| **`PROFILE_READ_ALL`**  | <code>'profile:read_all'</code>  |
| **`PROFILE_WRITE`**     | <code>'profile:write'</code>     |
| **`ACTIVITY_READ`**     | <code>'activity:read'</code>     |
| **`ACTIVITY_READ_ALL`** | <code>'activity:read_all'</code> |
| **`ACTIVITY_WRITE`**    | <code>'activity:write'</code>    |

</docgen-api>
