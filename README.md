# README

## Purpose

To allow customers to easily test their Outreach OAuth API authorization
process.

## Set up

1. Clone this repository
1. `bundle install`
1. Replace placeholder credentials in `config/initializers/omniauth.rb`
   with the `app_id` and `secret` for your Outreach application
1. Set up SSL for Puma (the localhost server used for this app)
   following the directions here:
https://gist.github.com/dankozlowski/564006869a4d57eb6bffb31d9a84e921

## Usage

1. For the duration of this test, add your Outreach application's
   redirect_url to your `/etc/hosts` file redirecting to `127.0.0.1:3000`.
1. Start Puma with SSL using the certs generated in the last step of
   Setup: `puma -b
'ssl://127.0.0.1:3000?key=<YOUR_HOME_DIR>/.ssh/server.key&cert=<YOUR_HOME_DIR>/.ssh/server.crt'`.  You should see the SSL listener in the server STDOUT: `Listening on
    ssl://127.0.0.1:3000?key=<YOUR_HOME_DIR>/.ssh/server.key&cert=<YOUR_HOME_DIR>/.ssh/server.crt`

1. In a web browser window, access
   `https://localhost:3000/auth/outreach/`.  If correctly configured,
you should be prompted to authorize your application.  If this step fails, check your `APP_ID` and `APP_SECRET` in the initializer.
1. Authorize your application by clicking 'Authorize'.  You will be
   redirected to a blank page at
`https://localhost:3000/auth/outreach/callback?code=<code>&state=<state>`.
1. Assert that the STDOUT for the Rails server contains something like

```
#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash
meta=#<OmniAuth::AuthHash api=#<OmniAuth::AuthHash application="Richard
Omniauth" permissions=#<Hashie::Array []> requests=#<OmniAuth::AuthHash
current=0 maximum=0> versions=#<OmniAuth::AuthHash last="1.0"
self="1.0">> org=#<OmniAuth::AuthHash>
request="a11a4aa6-a65d-46ec-adf1-7b72ecec2392" user=#<OmniAuth::AuthHash
email="<YOUR_OUTREACH_EMAIL>">>>>
```

at the bottom.  If so, your app was successfully authorized!

## Having issues?

We're here for you!  Please reach out to our platform team at
platform@outreach.io for assistence.

## Contributing

We love impriving our tooling for customers.  If you see a way we could
improve the usefulness of this tool, please reach out to
platform@outreach.io or fork and submit a PR!

## License

Copyright 2017 Outreach

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
