import '../backend/api_requests/api_calls.dart';
import '../client_create_demand/client_create_demand_widget.dart';
import '../components/list_menu_widget.dart';
import '../components/list_work_types_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/instant_timer.dart';
import '../flutter_flow/place.dart';
import '../home_pro/home_pro_widget.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageCopyWidget extends StatefulWidget {
  const HomePageCopyWidget({Key? key}) : super(key: key);

  @override
  _HomePageCopyWidgetState createState() => _HomePageCopyWidgetState();
}

class _HomePageCopyWidgetState extends State<HomePageCopyWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'buttonOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 1220.ms,
          duration: 2000.ms,
          hz: 2,
          offset: Offset(0, 0),
          rotation: 0.017,
        ),
      ],
    ),
  };
  ApiCallResponse? apiResultc0rr;
  InstantTimer? instantTimer;
  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  String? choiceChipsValue;
  double? sliderValue;
  bool? switchValue;
  var placePickerValue = FFPlace();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      FFAppState().update(() {
        FFAppState().normalfontsize = 15.0;
        FFAppState().smallpolice =
            functions.findsmallpolice(MediaQuery.of(context).size.width);
      });
      FFAppState().update(() {
        FFAppState().tinyfont =
            functions.findtinyfont(MediaQuery.of(context).size.width);
      });
      instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 4700),
        callback: (timer) async {
          if (FFAppState().appmode == 'pro') {
            await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeProWidget(),
              ),
              (r) => false,
            );
          } else {
            apiResultc0rr = await MapAdressCall.call(
              lon: functions.longitude(currentUserLocationValue),
              lat: functions.latitude(currentUserLocationValue),
            );
            if ((apiResultc0rr?.succeeded ?? true)) {
              FFAppState().update(() {
                FFAppState().basisdata = (apiResultc0rr?.jsonBody ?? '');
              });
              FFAppState().update(() {
                FFAppState().ownrocketchatid = MapAdressCall.ownrocketchatid(
                  (apiResultc0rr?.jsonBody ?? ''),
                ).toString().toString();
                FFAppState().rocketchattoken = MapAdressCall.rockettoken(
                  (apiResultc0rr?.jsonBody ?? ''),
                ).toString().toString();
              });
            }
          }
        },
        startImmediately: true,
      );
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    instantTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 70,
            height: 70,
            child: SpinKitCircle(
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 70,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(1, 0, 1, 0),
              child: Builder(builder: (context) {
                final _googleMapMarker =
                    ((FFAppState().manualdestination != null &&
                                FFAppState().manualdestination != '') &&
                            (placePickerValue.address != null &&
                                placePickerValue.address != '')
                        ? placePickerValue.latLng
                        : currentUserLocationValue);
                return FlutterFlowGoogleMap(
                  controller: googleMapsController,
                  onCameraIdle: (latLng) => googleMapsCenter = latLng,
                  initialLocation: googleMapsCenter ??=
                      currentUserLocationValue!,
                  markers: [
                    if (_googleMapMarker != null)
                      FlutterFlowMarker(
                        _googleMapMarker.serialize(),
                        _googleMapMarker,
                      ),
                  ],
                  markerColor: GoogleMarkerColor.cyan,
                  mapType: MapType.normal,
                  style: GoogleMapStyle.retro,
                  initialZoom: 17,
                  allowInteraction: true,
                  allowZoom: true,
                  showZoomControls: false,
                  showLocation: true,
                  showCompass: true,
                  showMapToolbar: false,
                  showTraffic: false,
                  centerMapOnMarkerTap: false,
                );
              }),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(9, 60, 9, 7),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 6),
                        child: Container(
                          height: 45,
                          child: Stack(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(),
                                    child: SvgPicture.asset(
                                      'assets/images/Titre_DEPANIKO.svg',
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 55,
                                    icon: Icon(
                                      Icons.menu_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              child: ListMenuWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 9, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 38,
                              decoration: BoxDecoration(),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: 360,
                                          child: ListWorkTypesWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: FFAppState().generaljob != null &&
                                        FFAppState().generaljob != ''
                                    ? FFAppState().generaljob
                                    : 'Je recherche un...',
                                icon: Icon(
                                  Icons.search,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 19,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 33,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: FFAppState().normalfontsize,
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0x0E4B39EF),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 9, 0, 1),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: Container(
                                  height: 31,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        9, 0, 9, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          'Adresse:',
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 3, 0, 3),
                                child: InkWell(
                                  onTap: () async {
                                    currentUserLocationValue =
                                        await getCurrentUserLocation(
                                            defaultLocation: LatLng(0.0, 0.0));
                                    FFAppState().update(() {
                                      FFAppState().manualdestination =
                                          functions.stringifylocation(
                                              currentUserLocationValue);
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 2, 0),
                                        child: Container(
                                          height: 31,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              switchValue == true
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    11, 3, 11, 3),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons
                                                      .satelliteDish,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  size: 14,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(3, 0, 0, 0),
                                                  child: AutoSizeText(
                                                    valueOrDefault<String>(
                                                      (apiResultc0rr?.succeeded ??
                                                                  true) !=
                                                              null
                                                          ? valueOrDefault<
                                                              String>(
                                                              getJsonField(
                                                                (apiResultc0rr
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.gps_location.road''',
                                                              ).toString(),
                                                              'Position inconnue',
                                                            )
                                                          : 'GPS',
                                                      'GPS',
                                                    ).maybeHandleOverflow(
                                                      maxChars: 16,
                                                      replacement: '…',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (placePickerValue.address != null &&
                                          placePickerValue.address != '')
                                        Container(
                                          width: 47,
                                          height: 37,
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: placePickerValue.address !=
                                                    null &&
                                                placePickerValue.address != '',
                                            child: Switch(
                                              value: switchValue ??= false,
                                              onChanged: (newValue) async {
                                                setState(() =>
                                                    switchValue = newValue!);
                                                if (newValue!) {
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .manualdestination =
                                                        placePickerValue
                                                            .address;
                                                  });
                                                  await googleMapsController
                                                      .future
                                                      .then(
                                                    (c) => c.animateCamera(
                                                      CameraUpdate.newLatLng(
                                                          placePickerValue
                                                              .latLng
                                                              .toGoogleMaps()),
                                                    ),
                                                  );
                                                } else {
                                                  currentUserLocationValue =
                                                      await getCurrentUserLocation(
                                                          defaultLocation:
                                                              LatLng(0.0, 0.0));
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .manualdestination = '';
                                                  });
                                                  await googleMapsController
                                                      .future
                                                      .then(
                                                    (c) => c.animateCamera(
                                                      CameraUpdate.newLatLng(
                                                          currentUserLocationValue!
                                                              .toGoogleMaps()),
                                                    ),
                                                  );
                                                }
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              activeTrackColor:
                                                  Color(0x9000BBF2),
                                              inactiveTrackColor:
                                                  Color(0x753354A3),
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3, 0, 0, 0),
                                        child: Container(
                                          height: 31,
                                          decoration: BoxDecoration(),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 2, 0),
                                              child: FlutterFlowPlacePicker(
                                                iOSGoogleMapsApiKey:
                                                    'AIzaSyBnG8-Zs13ccVvwrmL9wwxPZmC9QYL9jmw',
                                                androidGoogleMapsApiKey:
                                                    'AIzaSyArLWfPo_xo59CFQqdSsIMWedpw0Yyj9M8',
                                                webGoogleMapsApiKey:
                                                    'AIzaSyBnG8-Zs13ccVvwrmL9wwxPZmC9QYL9jmw',
                                                onSelect: (place) async {
                                                  setState(() =>
                                                      placePickerValue = place);
                                                },
                                                defaultText: 'Autre adresse',
                                                buttonOptions: FFButtonOptions(
                                                  height: 31,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: FFAppState()
                                                            .tinyfont,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterFlowChoiceChips(
                          initiallySelected: ['Maintenant'],
                          options: [
                            ChipData('Maintenant'),
                            ChipData('Pour plus tard')
                          ],
                          onChanged: (val) =>
                              setState(() => choiceChipsValue = val?.first),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: FFAppState().normalfontsize,
                                    ),
                            iconColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            iconSize: 16,
                            labelPadding:
                                EdgeInsetsDirectional.fromSTEB(14, 3, 14, 3),
                            elevation: 4,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Poppins',
                                      fontSize: FFAppState().normalfontsize,
                                      fontWeight: FontWeight.w600,
                                    ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 16,
                            labelPadding:
                                EdgeInsetsDirectional.fromSTEB(14, 3, 14, 3),
                            elevation: 4,
                          ),
                          chipSpacing: 8,
                          rowSpacing: 8,
                          multiselect: false,
                          initialized: choiceChipsValue != null,
                          alignment: WrapAlignment.center,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 12),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 31,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        9, 0, 9, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AutoSizeText(
                                          'Distance de recherche:  ±',
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14,
                                              ),
                                        ),
                                        Text(
                                          '${formatNumber(
                                            sliderValue,
                                            formatType: FormatType.compact,
                                          )}km',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(7),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                    child: Slider(
                                      activeColor: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      min: 5,
                                      max: 90,
                                      value: sliderValue ??= 25,
                                      divisions: 85,
                                      onChanged: (newValue) {
                                        newValue = double.parse(
                                            newValue.toStringAsFixed(0));
                                        setState(() => sliderValue = newValue);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 48,
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: FFAppState().generaljob != null &&
                                  FFAppState().generaljob != '',
                              child: FutureBuilder<ApiCallResponse>(
                                future: MapAdressCall.call(
                                  lat: functions
                                      .latitude(currentUserLocationValue),
                                  lon: functions
                                      .longitude(currentUserLocationValue),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 70,
                                        height: 70,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 70,
                                        ),
                                      ),
                                    );
                                  }
                                  final buttonMapAdressResponse =
                                      snapshot.data!;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));
                                      FFAppState().update(() {
                                        FFAppState()
                                            .preciselocation = FFAppState()
                                                        .manualdestination !=
                                                    null &&
                                                FFAppState()
                                                        .manualdestination !=
                                                    ''
                                            ? FFAppState().manualdestination
                                            : getJsonField(
                                                buttonMapAdressResponse
                                                    .jsonBody,
                                                r'''$.gps_location.address''',
                                              ).toString();
                                        FFAppState().generallocation =
                                            getJsonField(
                                          buttonMapAdressResponse.jsonBody,
                                          r'''$.city''',
                                        ).toString();
                                      });
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ClientCreateDemandWidget(
                                            latitude: FFAppState()
                                                            .manualdestination !=
                                                        null &&
                                                    FFAppState()
                                                            .manualdestination !=
                                                        ''
                                                ? functions.latitude(
                                                    placePickerValue.latLng)
                                                : functions.latitude(
                                                    currentUserLocationValue),
                                            longitude: FFAppState()
                                                            .manualdestination !=
                                                        null &&
                                                    FFAppState()
                                                            .manualdestination !=
                                                        ''
                                                ? functions.longitude(
                                                    placePickerValue.latLng)
                                                : functions.longitude(
                                                    currentUserLocationValue),
                                            job: FFAppState().generaljob,
                                            address:
                                                FFAppState().preciselocation,
                                            interventiontype: choiceChipsValue,
                                            searchdistance: sliderValue,
                                          ),
                                        ),
                                      );
                                    },
                                    text: 'Faire une demande',
                                    icon: Icon(
                                      Icons.construction_sharp,
                                      size: 19,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize:
                                                FFAppState().normalfontsize,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'buttonOnPageLoadAnimation']!);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
