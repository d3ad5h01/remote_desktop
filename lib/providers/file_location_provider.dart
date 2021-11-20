import 'package:flutter/material.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';

import '../constants.dart';

class FileLocation with ChangeNotifier {
  String _fileLocation = '-0-';
  bool _isLoading =true;
  String get fileLocation => _fileLocation;
  bool get isLoading => _isLoading;
  Widget _loadingScreenSystemInfo = Container();
  Widget get loadingScreenSystemInfo => _loadingScreenSystemInfo;



  void noLoad()
  {
    _isLoading = false;
    _loadingScreenSystemInfo = Container();
    notifyListeners();
  }

  void setLoadingScreenSystemInfo()
  {
    _loadingScreenSystemInfo = Column(
      children: [
        CircularProgressIndicator(),
        SizedBox(height:10),
        Text('Setting up environment..',
          style: TextStyle(
            fontSize: 15.0,
            color: Constants.fontColor,
            fontWeight: FontWeight.w600,
          ),),
      ],
    );
    _isLoading = true;
    notifyListeners();

  }




  void reset(String newFileLocation) {
    _fileLocation = newFileLocation;
    notifyListeners();
  }
}