import { WebPlugin } from '@capacitor/core';

import type { StravaAuthOptions, StravaAuthPlugin } from './definitions';

export class StravaAuthWeb extends WebPlugin implements StravaAuthPlugin {
  async authorize(options: StravaAuthOptions): Promise<void> {
    window.location.href = `https://www.strava.com/oauth/authorize?client_id=${encodeURI(
      options.clientId,
    )}&redirect_uri=${encodeURI(options.redirectUri)}&response_type=${encodeURI(
      options.responseType,
    )}&approval_prompt=${encodeURI(options.approvalPrompt)}&scope=${encodeURI(
      options.scope,
    )}&state=${encodeURI(options.state)}`;
  }
}
