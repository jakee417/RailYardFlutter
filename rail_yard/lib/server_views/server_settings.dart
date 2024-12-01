class ServerSettings {
  ServerSettings({
    this.name = "Yard",
    this.hostname = "pybd",
    this.localDomain = false,
    this.mac,
    this.port,
    this.ipAddress,
    this.version,
  });
  String name;
  String hostname;
  bool localDomain;
  String? mac;
  String? port;
  String? ipAddress;
  String? version;
}
