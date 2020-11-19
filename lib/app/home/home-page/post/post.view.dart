import 'dart:io';

import 'package:app_tv/utils/screen_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff068189),
        title: Text("Bài viết"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _createStatus(),
          ],
        ),
      ),
    );
  }

  Widget _createStatus() {
    return Container(
        width: double.infinity,
        // height: SizeConfig.blockSizeVertical * 50,
        margin: EdgeInsets.all(10.0),
        child: Card(
          color: Colors.grey[300],
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 5.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(15.0),
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.all(5.0),
                      child: ClipOval(
                        child: Image.network(
                          'https://www.elle.vn/wp-content/uploads/2017/07/25/hinh-anh-dep-7.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nguyen Van A',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FormBuilderTextField(
                  maxLines: null,
                  attribute: 'status',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 21),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Status ...",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validators: [FormBuilderValidators.required()],
                  onChanged: (dynamic val) {},
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                height: SizeConfig.blockSizeVertical * 30,
                width: double.infinity,
                child: AssetThumb(asset: images[0], width: 200,
                    height: 200),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.camera_alt),
                      iconSize: 30,
                      onPressed: loadAssets),
                  IconButton(
                      icon: Icon(Icons.cancel_schedule_send),
                      iconSize: 30,
                      onPressed: () {}),
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
        ));
  }

  File file;
  String fileName;
  MultipartFile multipartFile;

  List<Asset> images = <Asset>[];
  List<MultipartFile> multipartImageList = <MultipartFile>[];

  Future<void> loadAssets() async {
    images.clear();
    List<Asset> resultList = <Asset>[];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#E3161D",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }
    if (!mounted) return;
    images = resultList;
    multipartImageList.clear();
    for (var i in images) {
      setFile(i);
    }
  }

  Future<void> setFile(Asset asset) async {
    ByteData byteData = await asset.getByteData();
    List<int> imageData = byteData.buffer.asUint8List();
    MultipartFile multipartFile = MultipartFile.fromBytes(
      imageData,
      filename: 'delivery.png',
      contentType: MediaType("image", "png"),
    );
    multipartImageList.add(multipartFile);
  }
}
