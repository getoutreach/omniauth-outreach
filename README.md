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
