class NetworkProvider {

  Map<String, dynamic>? network;

  Map<String, dynamic>? verifyNetworkProvider(phoneNumber) {
    
    // MTN numbers verification
    /// This regex matches each number
    /// 
    /// [6] verifies that the first number must be a 6
    /// ([7][0-9]) verifies the second and third number after 6. the second number must be 7 and the third must range between 0 and 9
    RegExp mtnVerification = RegExp(r'^[6](([7][0-9])|([5][0-4])|([8][0-3]))');

    // ORANGE numbers verification
    RegExp orangeVerification = RegExp(r'^[6](([9][0-9])|([5][5-9]))');

    // verify if user has MTN provider
    if (mtnVerification.hasMatch(phoneNumber.toString())) {
      network = {
        "Success" : true,
        "Network" : "MTN"
      };
    }
    
    // verify if user has ORANGE provider
    else if (orangeVerification.hasMatch(phoneNumber.toString())) {
      network = {
        "Success" : true,
        "Network" : "ORANGE"
      };
    } else {
      // If it not a provider having mobile e-wallet
      network = {
        "Success" : false,
        "Network" : "UNKNOWN"
      };
    }

    return network;
  }
}