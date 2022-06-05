export interface StravaAuthPlugin {
  /**
   * Authorize using the Strava API to receive an authorization code.
   */
  authorize(options: StravaAuthOptions): Promise<void>;
}

export interface StravaAuthOptions {
  /**
   * Your App ID, found in the Strava settings.
   */
  clientId: string;
  /**
   * URL to redirect to after authorization.
   */
  redirectUri: string;
  /**
   * Must be `code`, accorind to Strava docs.
   */
  responseType: 'code';
  /**
   * Force prompt again even if already authorized earlier.
   */
  approvalPrompt: 'force' | 'auto';
  /**
   * See Strava Docs: {@link https://developers.strava.com/docs/authentication/#details-about-requesting-access}.
   */
  scope: StravaAuthScope;
  /**
   * Returned as a parameter when redirected to `redirectUri`.
   */
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
