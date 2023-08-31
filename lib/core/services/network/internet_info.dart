import 'package:connecteo/connecteo.dart';

import 'network.dart';

class InternetInfoImp implements InternetInfo {
  final ConnectionChecker checker;

  const InternetInfoImp({
    required this.checker,
  });

  @override
  Future<bool> hasConnection() => checker.isConnected;
}
