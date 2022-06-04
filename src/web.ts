import { WebPlugin } from '@capacitor/core';

import type { StravaAuthOptions, StravaAuthPlugin } from './definitions';

export class StravaAuthWeb extends WebPlugin implements StravaAuthPlugin {
  async authorize(options: StravaAuthOptions): Promise<void> {}
}
