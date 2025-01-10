class AppConfig {
  static const String supabaseUrl = const String.fromEnvironment('SUPABASE_URL');
  static const String supabaseAnonKey = const String.fromEnvironment('SUPABASE_ANON_KEY');
  
  // App-wide constants
  static const String appName = 'AWS Cert Prep Pro';
  static const String appVersion = '1.0.0';
  
  // Feature flags
  static const bool enablePushNotifications = true;
  static const bool enableOfflineMode = true;
  static const bool enableSocialSharing = true;
}