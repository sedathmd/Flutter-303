//ana sayfayı part of ile veriyoruz
part of './part_of_learn.dart';

//appbar prefferedSizeWidget oldugu icin with ile verip override ediyoruz
//daha sonra override ettigimize bir size veriyoruz
class _PartOfAppBar extends StatelessWidget with PreferredSizeWidget {
  const _PartOfAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('data'),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded))
      ],
    );
  }

  @override
  //kToolbarHeight defaultta 56dır
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
