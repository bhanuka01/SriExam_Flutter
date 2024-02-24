import 'package:url_launcher/url_launcher.dart';

import 'package:al_app_api/model.dart/Home/imageModel.dart';
import 'package:flutter/material.dart';

import '../flutterflow/flutter_flow_theme.dart';
import '../model.dart/Home/picLink.dart';
// String url ='';
class URLInfo{
  static const String web="https://bhanu.eu.org/";
  static const String email="mailto:bhanukadilshan2002@gmail.com?subject=SriExam_Issues&body=.";
}
class AboutMe extends StatelessWidget {
  const AboutMe({super.key});
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colorlab.darkBlue,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Container(
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  PicLink_23_07_01.about,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: Text(
                'Bhanuka Dilshan',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 30, 0, 0),
                      child: Text(
                        'Information',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.08,
                        height: 74,
                        decoration: BoxDecoration(
                          color: const Color(0x5B000000),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Icon(
                                    Icons.web_asset_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                    child: Text(
                                      'Web Site',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 10, 0),
                                child: InkWell(
                                  onTap: () =>
                                      // _launchURL(URLInfo.web),
                                  // _launchURL("https://bhanu.eu.org/"),
                                  // _launchURL(''),
                                      launchUrl(
                                    Uri.parse(URLInfo.web),
                                    mode: LaunchMode.externalApplication,
                                  ),
                                  child: const Text(
                                    'bhanu.eu.org',
                                    style: TextStyle(

                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                      decorationThickness: 3 ,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.08,
                        height: 74,
                        decoration: BoxDecoration(
                          color: const Color(0x5B000000),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Icon(
                                    Icons.developer_mode,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                    child: Text(
                                      'Dev',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 10, 0),
                                child: Text(
                                  'Flutter Mobile App',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.08,
                  height: 74,
                  decoration: BoxDecoration(
                    color: const Color(0x5B000000),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: Icon(
                              Icons.school,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 0, 0),
                              child: Text(
                                'Study',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Text(
                            'Mathematics & Statistics\n(UOR)',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.08,
                  height: 74,
                  decoration: BoxDecoration(
                    color: const Color(0x5B000000),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: Icon(
                              Icons.email,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 0, 0),
                              child: Text(
                                'Send Mail Any issue ',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                       Align(
                        alignment: const AlignmentDirectional(1, 0),
                        child: Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: InkWell(
                            onTap: () => _launchURL(URLInfo.email),

                            child: const Text(
                              'Click',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color:Colors.blue ,
                                fontWeight: FontWeight.w600,
                                decoration:TextDecoration.underline ,
                                decorationColor: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.08,
                  height: 74,
                  decoration: BoxDecoration(
                    color: const Color(0x5B000000),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: Icon(
                              Icons.verified_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 0, 0),
                              child: Text(
                                'App Version',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1, 0),
                        child: Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Text(
                            '1.0.0',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
