class Env {
  final String version;
  final String apiAddress;
  final String? sentryUrl;
  final String shareUrl;

  const Env({
    required this.version,
    required this.apiAddress,
    required this.shareUrl,
    this.sentryUrl,
  });
}