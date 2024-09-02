void main() async {
  DataService dataService = DataService();
  String data = await dataService.getData();

  print(data);
}

class DataService {
  Future<String> _getDataFromCloud() async {
    await Future.delayed(Duration(seconds: 4));
    print('get faked data');
    return 'dummy data';
  }

  Future<String> _getDataFromOtherCloud() async {
    await Future.delayed(Duration(seconds: 2));
    print('get next faked data');
    return 'faked data';
  }

  Future<String> _parseDataFromCloud({required String data}) async {
    await Future.delayed(Duration(seconds: 2));
    print('get parsed data');
    return data.toUpperCase();
  }

  Future<String> getData() async {
    final dataFromCloud = await _getDataFromCloud();
    final dataFromOtherCloud = await _getDataFromOtherCloud();
    final String parsedData = await _parseDataFromCloud(data: '$dataFromCloud - $dataFromOtherCloud');

    return parsedData;
  }

  Future<String> getParallelData() async {
    final dataFromCloud = _getDataFromCloud();
    final dataFromOtherCloud = _getDataFromOtherCloud();

    // final dataA = await dataFromCloud;
    // final dataB = await dataFromOtherCloud;

    final [dataA, dataB] = await Future.wait([dataFromCloud, dataFromOtherCloud]);

    final String parsedData = await _parseDataFromCloud(data: '$dataA - $dataB');

    return parsedData;
  }
}
