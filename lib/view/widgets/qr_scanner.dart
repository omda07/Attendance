import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../control/cubit/cubit.dart';
import '../../control/cubit/states.dart';
import '../resources/color_manager.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<AttendanceCubit, AttendanceStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AttendanceCubit.get(context);
          return Stack(
            alignment: Alignment.center,
            children: [
              buildQrView(context),
              Positioned(
                bottom: 50,
                child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.white),
                    child: Text(barcode != null && cubit.attendModel != null

                          ? 'Result ${barcode!.code} ${cubit.attendModel!.message}'
                          : 'Scan a QR ${cubit.errorMessage}'),



                    ),
              ),
              Positioned(
                top: 30,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: () async {
                        await controller?.flipCamera();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getCameraInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            return Text(
                                'Camera facing ${describeEnum(snapshot.data!)}');
                          } else {
                            return const Text('loading');
                          }
                        },
                      )),
                ),
              ),
            ],
          );
        },
      ),
    ));
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderRadius: 15,
          borderWidth: 10,
          borderLength: 20,
          borderColor: ColorManager.primary,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    String code = '';
    controller.scannedDataStream.listen((barcode)async {

      setState(() {
        this.barcode = barcode;
      });
      print(barcode.code.toString());
      if (barcode.code.toString() != code) {
        code = barcode.code.toString();
     await   AttendanceCubit.get(context)
            .userAttend(int.parse(barcode.code.toString()));
      }

    });
  }
}
