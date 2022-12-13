import 'dart:collection';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'custom_exception.dart';

//3.adım
//abstract bir class olustururuz
abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  //böyle abstract class icerisinde yazdıgımız her özelligi
  //implements ettigimiz classlarda da kendine göre düzenlemeliyiz
  //zaten buraya özellik ekledigimizde implements edilen classlarda override etmemiz icin uyarı gelir
  void toShare(String path) async {
    await launch(path);
  }
}
//daha sonra alttaki FileDownload da implements ederiz ve override ederiz

//1.adım
//normalde bunu herkes kullanabilir ama biz sadece fileItemdan türeyenlerin kullanmasını istiyoruz
class FileDownload extends IFileDownload {
  //nullable kullanmamız gerekiyor
  //bool geri dönüs tipi yapıyoruz
  @override
  bool? downloadItem(FileItem? fileItem) {
    // if (fileItem == null) Exception();  bunun yerine özellestirdigimiz exceptionı atarız
    if (fileItem == null) throw FileDownloadException();
    return true;
  }

  //abstract sınıfın bütün özelliklerini kabul edip ici bos olanları doldururuz
  void smsShare() {}
}

//mixin extends ile kullanılır ama implements ile kullanılamaz
//4.adım
class SMSDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    return true;
  }

  //burada abstract classın özelliklerini kendimize göre yorumluyoruz
  @override
  void toShare(String path) async {
    //https://pub.dev/packages/url_launcher 'a göre yaptım sms kısmını
    await launch("sms:$path");
  }
}

//2. adım
//bir class daha yaparız
//name ve file yapıp constructor verir ve dart:io import ederiz
class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

//6.adım
//class SpecialDownload extends ShareMixin şeklinde kullanamayız çünkü
//aşşagıda mixin ile kosula bagladık
class SpecialDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    throw UnimplementedError();
  }
}

//5.adım
//sadece IFiledownload kalıtımına sahip olanlar kullanabilir demek
mixin ShareMixin on IFileDownload {
  void toShowFile() {}
}
