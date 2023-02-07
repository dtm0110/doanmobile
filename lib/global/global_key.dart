import 'package:flutter/material.dart';

class Global {
  static GlobalKey bottomNav = GlobalKey(debugLabel: "bottomNav");
  static GlobalKey investViewList = GlobalKey(debugLabel: "investViewList");

  static const auth0Domain = 'bam-dev.us.auth0.com';
  static const auth0ClientId = 'yTjfsD9AwRqX3M2xuO9FR7pqvs5Nu4ku';
  static const auth0RedirectUri = 'io.bam.wallet.app://callback';
  static const auth0Secret =
      'WfHo2-jA0boDrfiZOV9P_4KBpkorUlLf2mMOCmQ6D7rHlZ-C6gJRw2ODhrSM4x-x';
  static const auth0Issuer = 'https://auth.bams.dev/';
  static const auth0Audience = 'https://auth.bams.dev/id';
  static const auth0Scope =
      'openid profile offline_access email encrypt:ethereum proxy:nodes read:ethereum sign:ethereum write:ethereum';
  static const connection = "BAM-Users";
  static const auth0GrantType = "http://auth0.com/oauth/grant-type/password-realm";
}
