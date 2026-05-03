enum AppEnvironment { development, staging, production }

class EnvironmentConfig {
  const EnvironmentConfig({
    required this.environment,
    required this.appName,
    required this.enableDebugTools,
  });

  static const current = EnvironmentConfig(
    environment: AppEnvironment.development,
    appName: 'Quest for Fitness',
    enableDebugTools: true,
  );

  final AppEnvironment environment;
  final String appName;
  final bool enableDebugTools;
}
