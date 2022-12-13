import 'package:flutter_application_1/202/cache/shared_learn_cache.dart';
import 'package:flutter_application_1/303/reqres_resource/service/reqres_service.dart';
import '../../../product/service/project_dio.dart';
import '../model/resource_model.dart';
import '../view/reqres_view.dart';

//abstract class ReqresViewModel extends State<ReqresView> with ProjectDioMixin
//yukarıdaki gibi yapmak yerine State yerine SharedLearnCache'de tanımladıgımız
//generic LoadingStatefull'dan türetirsek bu sayfada da changeLoading'i kullanabiliriz
//alttaki gibi
abstract class ReqresViewModel extends LoadingStatefull<ReqresView>
    with ProjectDioMixin {
  //late final yapınca sadece initState icerisinde kullanılabilir
  late final IReqresService reqresService;
  List<Data> resources = [];
  //direk resources döndürseydik
  //List<ResourceModel> resources = [];
  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    //ReqresService(Dio(BaseOptions(baseUrl: 'https://reqres.in/api')));
    //yukardaki gibi yazmak yerine product altında service klasöründe
    //project_dio.dart dosyasında mixin ile base url vererek bu sekile cevirdik

    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    //direk resources döndürseydik
    //resources = await reqresService.fetchResourceItem() ?? [];
    changeLoading();
  }
}
