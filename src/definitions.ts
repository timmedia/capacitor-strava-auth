export interface StravaAuthPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
