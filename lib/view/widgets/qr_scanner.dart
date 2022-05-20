import 'dart:io';
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
                bottom: 10,
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
