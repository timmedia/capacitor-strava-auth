package com.timmedia.plugins.stravaauth;

import android.content.Intent;
import android.net.Uri;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "StravaAuth")
public class StravaAuthPlugin extends Plugin {

    private StravaAuth implementation = new StravaAuth();

    @PluginMethod
    public void authorize(PluginCall call) {
        Uri intentUri = Uri
            .parse("https://www.strava.com/oauth/mobile/authorize")
            .buildUpon()
            .appendQueryParameter("client_id", call.getString("clientId"))
            .appendQueryParameter("redirect_uri", call.getString("redirectUri"))
            .appendQueryParameter("response_type", call.getString("responseType"))
            .appendQueryParameter("approval_prompt", call.getString("approvalPrompt"))
            .appendQueryParameter("scope", call.getString("scope"))
            .appendQueryParameter("state", call.getString("state"))
            .build();

        Intent intent = new Intent(Intent.ACTION_VIEW, intentUri);
        getContext().startActivity(intent);
        call.resolve();
    }
}
