import 'package:flutter/material.dart';
import '../202/service/post_service.dart';
import '../202/service/post_model.dart';

//bu sayfayı Tab_learn'de cagiririz
class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView>
    with AutomaticKeepAliveClientMixin {
//AutomaticKeepAliveClientMixin'i ekleyip alttaki override'da true verirsek
//yan sayfalara her gecip geldigimizde state'i bastan yüklemez.
//Sayfanın ortasındaki CircularProgressIndicator
  final IPostService _postService = PostService();
  //post service'e baglandık
  late final Future<List<PostModel>?> _itemsFuture;
  //daha sonra her setState'de servise tekrar istek atmaması icin FutureBuilder
  //icerisindeki future'a direk  _postService.fetchPostItemsAdvance(); vermek yerine
  //yukarıda late final ile tanımlayıp initstate icerisinde tanımlarsak
  //floatingactionbutton'a basıldıgındaki gibi setstate'den her seferinde etkilenmeyecek
  @override
  void initState() {
    super.initState();
    _itemsFuture = _postService.fetchPostItemsAdvance();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
        ),
        appBar: AppBar(),
        body: FutureBuilder<List<PostModel>?>(
          future: _itemsFuture,
          builder:
              (BuildContext context, AsyncSnapshot<List<PostModel>?> snapshot) {
            switch (snapshot.connectionState) {
              //internet yokken, beklerken, aktifken ve bittiginde
              case ConnectionState.none:
                return const Placeholder();
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data?[index].body ?? ''),
                        ),
                      );
                    },
                  );
                } else {
                  return const Placeholder();
                }
            }
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
