class CommonException implements Exception {
  final Map<ErrorType, String> mapMessage = const {
    ErrorType.NETWORK: "Wifi/4G/3G/GPRS connection is interrupted. Please check again!",
  };
  String? message;
  final ErrorType type;
  final int? code;

  CommonException({this.message, this.type = ErrorType.OTHER, this.code}) {
    if (message == null){
      if (mapMessage.containsKey(type)) {
        message = mapMessage[type];
      } else {
        message = "";
      }
    }
  }

  @override
  String toString() {
    return message ?? "";
  }

}
enum ErrorType {
  NETWORK, HTTP, SERVER, OTHER
}