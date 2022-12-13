class FileDownloadException implements Exception {
  //Exceptiondan implement ettigimiz icin exceptionın bütün özelliklerini taşır
  //toString yazıp override ediyoruz
  @override
  String toString() {
    return 'File download has failed';
  }
}
