import { WebPlugin } from '@capacitor/core';

import type { StravaAuthPlugin } from './definitions';

export class StravaAuthWeb extends WebPlugin implements StravaAuthPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
