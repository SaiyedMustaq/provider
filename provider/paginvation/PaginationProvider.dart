import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../InternetNotAvailable.dart';
import 'PhotoProvider.dart';

class PaginationProviderPage extends StatefulWidget {
  const PaginationProviderPage({Key? key}) : super(key: key);

  @override
  State<PaginationProviderPage> createState() => _PaginationProviderPageState();
}

class _PaginationProviderPageState extends State<PaginationProviderPage> {
  final ScrollController _controller = ScrollController();

  fetchData() {
    Provider.of<PhotoProvider>(context, listen: false).callPhotoApi();
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchData();
    });
    super.initState();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Provider.of<InternetConnectionStatus>(context) ==
              InternetConnectionStatus.disconnected
          ? const InternetNotAvailable()
          : Consumer<PhotoProvider>(
              builder: (context, value, child) => value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      controller: _controller,
                      itemBuilder: (context, index) {
                        if (index == value.photos.length - 1) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            height: h / 2,
                            margin: EdgeInsets.all(h / 18),
                            child: Hero(
                              transitionOnUserGestures: true,
                              tag: value.photos[index].id.toString(),
                              child: Image.network(
                                value.photos[index].src!.medium!.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: value.photos.length,
                    ),
            ),
    );
  }
}
