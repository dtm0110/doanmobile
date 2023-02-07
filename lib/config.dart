enum Environment { dev, production }

extension EnvironmentExtension on Environment {
  String get baseUrl {
    switch (this) {
      case Environment.dev:
        return 'http://18.141.185.213:5678';
      case Environment.production:
        return 'http://18.141.185.213:5678';
      default:
        return 'http://18.141.185.213:5678';
    }
  }
}

extension StringExtension on String {
  Environment get environment {
    switch (this) {
      case "dev":
        return Environment.dev;
      case "production":
        return Environment.production;
      default:
        return Environment.production;
    }
  }
}

const Environment environment = Environment.dev;
