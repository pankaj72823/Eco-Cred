import 'package:flutter_riverpod/flutter_riverpod.dart';


class IpAddressNotifier extends StateNotifier<String?> {
  IpAddressNotifier() : super(null);


  void setIpAddress(String ipAddress) {
    state = ipAddress;
  }
  void clearIpAddress() {
    state = null;
  }
}
final ipAddressProvider = StateNotifierProvider<IpAddressNotifier, String?>((ref) {
return IpAddressNotifier();
});


