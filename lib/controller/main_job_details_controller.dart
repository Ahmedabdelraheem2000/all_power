import 'dart:async';
import 'dart:io';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/model/main_jobs/main_job_data.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MainJobDetailsController extends GetxController{

  RxBool isLoad = false.obs;
  File? filePath;
  MainJobsData mainJob = MainJobsData();

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  Future<void> getMainJobDetails({required int sectionId, required int jobId}) async {
    await ApiRequests.getMainJobDetails(language: AppHelper.getAppLanguage(),
        sectionId: sectionId,
        jobId: jobId)
        .then((value) {
      if(value != null){
        mainJob = value.result!.mainJobs!;
      }
    });
  }

  void requestStoragePermission(BuildContext context, int jobId) async {
    if (await Permission.storage.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      print("storage permission: ${statuses[Permission.storage]}");
      pickPDFFile(context, jobId);
    }else {
      pickPDFFile(context, jobId);
    }
  }

  void pickPDFFile(BuildContext context, int jobId) async {
    FilePickerResult? filePicker = await FilePicker.platform.pickFiles();
    if(filePicker != null){
      filePath = File(filePicker.files.single.path!);
      showPDFFILEBottomSheet(context, filePath!.path, jobId);
      print('FIEL1: ${filePicker.files.single.path}');
      print('FIEL2: ${filePath!.path}');
      update();
    }
    update();
  }

  var _url = 'https://api.whatsapp.com/send?phone=';
  void launchWhatsAppString(String phone) async => await canLaunchUrl(Uri.parse('$_url$phone'))
      ? await launchUrl(Uri.parse('$_url$phone'))
      : AppHelper.showToast(message: 'Please install whatsapp Application');

  whatsapp({required String phone}) async{
    var contact = "+880123232333";
    var androidUrl = "whatsapp://send?phone=$phone&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$phone?text=${Uri.parse('Hi, I need some help')}";

    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl));
      }
      else{
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception{
      AppHelper.showToast(message: 'WhatsApp is not installed.');
      print('WhatsApp is not installed.');
    }
  }

  void sendEmail({required String toEmail}) async {
    final Email email = Email(
      body: 'Email body',
      subject: 'Email subject',
      recipients: ['$toEmail'],
      // cc: ['cc@example.com'],
      // bcc: ['bcc@example.com'],
      // attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  void showPDFFILEBottomSheet(BuildContext context, String path, int jobId) {
    showModalBottomSheet(
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: 500,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    alignment: AlignmentDirectional.topEnd,
                    margin: EdgeInsetsDirectional.only(end: 10, top: 8),
                    child: InkWell(
                        child: Icon(Icons.close, color: Colors.red),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Container(
                    height: 4,
                    width: 50,
                    margin: EdgeInsetsDirectional.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: AppColors.darkMainColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                      margin: EdgeInsetsDirectional.only(top: 12.r, bottom: 12, end: 20),
                      height: 250.h,
                      width: 280.w,
                      child: /*buildPDFVIew(path)*/ Container(
                        child: SfPdfViewer.file(key: _pdfViewerKey, filePath!),
                      )),
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                    child: AppText.medium(text:
                    path.split('/').last,
                      color: HexColor(AppColors.appMainColor),
                      fontSize: Platform.isAndroid ? 16.sp : 14.sp,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Obx(() => isLoad.isTrue ? Container(
                    margin: EdgeInsets.only(top: 8, bottom: 4),
                    child: LoadingAnimationWidget.fourRotatingDots(
                        color: AppColors.darkMainColor,
                        size: 25.h),
                  ) : Container()),
                  Container(
                      margin: EdgeInsetsDirectional.only(top: 10, start: 10, end: 10),
                      width: double.infinity,
                      child: AppWidgets.CustomButton(
                          radius: 8,
                          background: HexColor(AppColors.appMainColor),
                          borderColor: HexColor(AppColors.appMainColor),
                          text: 'send'.tr,
                          isUpperCase: false,
                          click: () {
                            sendPdfFile(filePath: path, jobId: jobId);
                          })),
                ],
              ),
            ),
          );
        });
  }

  // Widget buildPDFVIew(String path) => PDFView(
  //   filePath: path,
  //   enableSwipe: true,
  //   swipeHorizontal: true,
  //   autoSpacing: false,
  //   pageFling: true,
  //   pageSnap: true,
  //   defaultPage: currentPage!,
  //   fitPolicy: FitPolicy.BOTH,
  //   preventLinkNavigation:
  //   false, // if set to true the link is handled in flutter
  //   onRender: (_pages) {
  //     pages = _pages;
  //     isReady = true;
  //   },
  //   onError: (error) {
  //     print(error.toString());
  //   },
  //   onPageError: (page, error) {
  //
  //     print('$page: ${error.toString()}');
  //   },
  //   onViewCreated: (PDFViewController pdfViewController) {
  //     pdfController.complete(pdfViewController);
  //   },
  //   onLinkHandler: (String? uri) {
  //     print('goto uri: $uri');
  //   },
  //   onPageChanged: (int? page, int? total) {
  //     print('page change: $page/$total');
  //
  //   },
  // );

  void sendPdfFile({required String filePath, required int jobId}) {
    isLoad(true);
    ApiRequests.sendPdfFile(language: AppHelper.getAppLanguage(),
        file: filePath, mainJobId: jobId)
        .then((value) {
          isLoad(false);
          Get.toNamed(Routes.doneApplyJob);
    });
  }

}