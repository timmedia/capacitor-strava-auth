import { registerPlugin } from '@capacitor/core';

import type { StravaAuthPlugin } from './definitions';

const StravaAuth = registerPlugin<StravaAuthPlugin>('StravaAuth', {
  web: () => import('./web').then(m => new m.StravaAuthWeb()),
});

export * from './definitions';
export { StravaAuth };
