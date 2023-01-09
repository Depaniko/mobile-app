import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../../auth/auth_util.dart';

bool jobfunc(String? jobdef) {
  if (jobdef != null && jobdef != "") {
    return true;
  }
  return false;
}

double circlesizing(double? radix) {
  // Add your function code here!
  if (radix == null) {
    return 0.0;
  }
  return radix * 4.0;
}

String stringifylocation(LatLng? userlocation) {
  if (userlocation == null) {
    return "40.8295538,-73.9386429";
  }
  return "${userlocation.latitude},${userlocation.longitude}";
}

double dividebyseventytwo(double num) {
  return num / 32;
}

double findsmallpolice(double num) {
  return num / 36;
}

double findtinyfont(double num) {
  return num / 38;
}

String latitude(LatLng? gpslocation) {
  if (gpslocation == null) {
    return "40.8295538";
  }
  return "${gpslocation.latitude}";
}

String longitude(LatLng? gpslocation) {
  if (gpslocation == null) {
    return "-73.8295538";
  }
  return "${gpslocation.longitude}";
}

String? removelinereturns(String? faultystring) {
  return faultystring?.replaceAll("\n", " ");
}

LatLng? createLatLongs(List<dynamic> coordinates) {
  if (coordinates != null) {
    return LatLng(coordinates[0], coordinates[1]);
  }

  return null;
}

List<LatLng>? createAllLatLongs(List<dynamic> coordinates) {
  if (coordinates != null) {
    return coordinates.map((x) => LatLng(x[0], x[1])).toList();
  }

  return null;
}

List<String>? jsonstostrings(List<dynamic> jsoncoordinates) {
  return [jsoncoordinates[0].toString(), jsoncoordinates[1].toString()];
}
