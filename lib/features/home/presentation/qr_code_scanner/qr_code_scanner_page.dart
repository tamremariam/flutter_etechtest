import 'package:etechtest/core/themes/themes.dart';
import 'package:etechtest/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

import 'package:etechtest/core/uitils/permission_utils.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({super.key});

  @override
  State<QrCodeScannerPage> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage>
    with WidgetsBindingObserver {
  String? scannedResult;
  bool? cameraPermissionGranted;
  bool isCameraActive = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _checkPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      setState(() {
        isCameraActive = false;
      });
    } else if (state == AppLifecycleState.resumed) {
      _checkPermissions();
      setState(() {
        isCameraActive = true;
      });
    }
  }

  Future<void> _checkPermissions() async {
    final isGranted = await PermissionUtils.requestCameraPermission();
    setState(() {
      cameraPermissionGranted = isGranted;
    });

    if (!isGranted) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: CustomText(
              AppLocalizations.of(context)!.permissionDenied,
              size: TextSize.bodyLarge,
            ),
            content: CustomText(
              AppLocalizations.of(context)!.cameraPermissionRequired,
              size: TextSize.bodyLarge,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: CustomText(
                  AppLocalizations.of(context)!.ok,
                  size: TextSize.bodyLarge,
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cameraPermissionGranted == true
          ? Colors.black
          : AppThemes.formBackgroundColor,
      body: cameraPermissionGranted == null
          ? Stack(
              children: [
                Container(color: Colors.black),
                const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ],
            )
          : cameraPermissionGranted == true
              ? Stack(
                  children: [
                    if (isCameraActive)
                      QRCodeDartScanView(
                        scanInvertedQRCode: true,
                        typeScan: TypeScan.live,
                        onCapture: (Result result) {
                          setState(() {
                            scannedResult = result.text;
                          });
                        },
                      ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          scannedResult != null
                              ? Container(
                                  padding: const EdgeInsets.all(16),
                                  color: Colors.black.withOpacity(0.5),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomText(
                                        AppLocalizations.of(context)!
                                            .scannedResult,
                                        size: TextSize.bodyLarge,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        scannedResult!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: CustomText(
                                    AppLocalizations.of(context)!.noResultYet,
                                    size: TextSize.bodyLarge,
                                  ),
                                ),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CustomText(
                    AppLocalizations.of(context)!.cameraPermissionNotGranted,
                    size: TextSize.bodyLarge,
                  ),
                ),
    );
  }
}
