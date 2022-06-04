export interface StravaAuthPlugin {
  authorize(options: StravaAuthOptions): Promise<void>;
}

export interface StravaAuthOptions {
  clientId: string;
  redirectUri: string;
  responseType: 'code';
  approvalPrompt: 'force' | 'auto';
  scope: StravaAuthScope;
  state: string;
}

export enum StravaAuthScope {
  READ = 'read',
  READ_ALL = 'read_all',
  PROFILE_READ_ALL = 'profile:read_all',
  PROFILE_WRITE = 'profile:write',
  ACTIVITY_READ = 'activity:read',
  ACTIVITY_READ_ALL = 'activity:read_all',
  ACTIVITY_WRITE = 'activity:write',
}
