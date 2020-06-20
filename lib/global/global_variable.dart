import 'dart:typed_data';

import 'package:budikdamber/api_model/list_peralatan_response.dart';
import 'package:budikdamber/api_model/list_setup_process_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

String domain = "http://budikdamber.wiradipa.com";

GoogleSignIn globalGoogleSignIn;
FirebaseAuth globalFirebaseAuth;
UserDetails globalUserDetails;
AnimasiDong globalUserDipilih;

ListPeralatanResponse globalListPeralatanResponse;
ListSetupProcessResponse globalListSetupResponse;

int selectedContentId;

bool isCollapse = false;
//double xOffset = 0;
//double yOffset = 0;
//double scaleFactor = 1;
int currentSelected = 0;

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final String idToken;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData, this.idToken);
}

class AnimasiDong {
  int selectedIndex;
  double xOffset = 180;
  double yOffset = 150;
  double scaleFactor = 0.7;
  bool isDrawerOpen = true;

  AnimasiDong(this.selectedIndex, this.xOffset, this.yOffset, this.scaleFactor,
      this.isDrawerOpen);
}