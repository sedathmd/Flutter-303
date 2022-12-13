import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/cache/shared_learn_cache.dart';
import 'package:flutter_application_1/202/cache/shared_manager.dart';
import 'package:flutter_application_1/202/cache/user_cache/user_cache_manager.dart';
import 'user_model.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

//change loadingi kullanmak icin LoadingStatefull'dan extends ettik
class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManager userCacheManager;
  //final List<User> _users = UserItems().users;
  //üstteki satır kayıt satırı
  //alttaki satırı kayıt sonrası eklemeliyiz
  List<User> _users = [];
  @override
  void initState() {
    super.initState();
    initalazeAndSave();
  }

  Future<void> initalazeAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();
    await manager.init();
    userCacheManager = UserCacheManager(manager);
    //alttaki satırı ve yukarıda 17.satırda save ile kayıt yaptıktan sonraki satırı
    //kayıttan sonra eklemeliyiz
    _users = userCacheManager.getItems() ?? [];
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: isLoading
                ? CircularProgressIndicator(
                    color: Theme.of(context).scaffoldBackgroundColor)
                : null,
            actions: isLoading
                ? null
                : [
                    IconButton(
                        onPressed: () async {
                          changeLoading();
                          userCacheManager.saveItems(_users);
                          changeLoading();
                        },
                        icon: const Icon(Icons.download_for_offline_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_circle_outline))
                  ]),
        body: _UserListView(users: _users));
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({
    Key? key,
    required this.users,
  }) : super(key: key);
  //extract widget dedikten sonra yukarıda yapılması gereken esitleme burada yapılabilir
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(users[index].name ?? ''),
              subtitle: Text(users[index].description ?? ''),
              trailing: Text(users[index].url ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(decoration: TextDecoration.underline)),
            ),
          );
        });
  }
}
