class NetworkModel {
  final String ssid;
  final String password;
  final String encryption;

  NetworkModel({this.ssid, this.password, this.encryption});
}

List<NetworkModel> dummyData = [
  new NetworkModel(
    ssid: "aax_software_dex",
    password: "test",
    encryption: "WPA",
  ),
  new NetworkModel(
    ssid: "home",
    password: "test",
    encryption: "WPA",
  ),
];
