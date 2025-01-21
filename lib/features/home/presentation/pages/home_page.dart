import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/core/local_source/local_source.dart';
import 'package:task1/features/api/repository_impl.dart';
import 'package:task1/features/home/presentation/pages/mixin/home_mixin.dart';
import 'package:task1/features/home/presentation/pages/widgets/grid_widget.dart';

import '../../../../core/app_color/app_colors.dart';
import '../../blocs/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  late TabController tabController;
  late PageController pageController;
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 6,
      vsync: this,
    );
    pageController = PageController();
    bloc = HomeBloc(repository: RepositoryIml(Dio()));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    print('*********${LocalSource().favorites}*********');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hello Michael",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    fontFamily: "Inter"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 42),
                child: SizedBox(
                  height: 56,
                  child: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      controller: tabController,
                      onTap: (int index) {
                        tabController.animateTo(index,
                            duration: Duration(milliseconds: 400));
                        print('indexxx $index');
                        if (index == 1) {
                          context.read<HomeBloc>().add(CartHomeEvent());
                        }
                      },
                      tabs: [
                        Tab(
                          text: "All",
                          iconMargin: EdgeInsets.all(12),
                        ),
                        Tab(
                          text: "Audio",
                        ),
                        Tab(
                          text: "Drones + Electronics",
                        ),
                        Tab(
                          text: "Photo + Video",
                        ),
                        Tab(
                          text: "All2",
                        ),
                        Tab(
                          text: "All3",
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (p, n) => p.status != n.status,
                        builder: (context, state) {
                          final pages = List.generate(
                            6,
                            (index) => CachedNetworkImage(
                              imageUrl:
                                  state.product?.products[index].images.first ??
                                      "",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 160,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Container(
                                height: size.height / 4,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/default.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                          if (state.status == StatusEnum.loading) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black87,
                                strokeWidth: 7,
                                strokeAlign: 4,
                              ),
                            );
                          } else if (state.status == StatusEnum.error) {
                            return Center(
                              child: Text(state.message.toString()),
                            );
                          } else if (state.status == StatusEnum.success) {
                            return Column(
                             
                            
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 36, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Deals of the day",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            fontFamily: "Inter"),
                                      ),
                                      Text(
                                        "See all",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            fontFamily: "Inter"),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 170,
                                  width: size.width*1.5,
                                  child: PageView.builder(
                                    controller: pageController,
                                    itemBuilder: (_, index) {
                                      return pages[index % pages.length];
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Center(
                                    child: SmoothPageIndicator(
                                      controller: pageController,
                                      count: pages.length,
                                      effect: const WormEffect(
                                        dotHeight: 16,
                                        dotWidth: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 32, bottom: 8),
                                  child: Text(
                                    "Recommended for you",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Inter"),
                                  ),
                                ),
                                Expanded(
                                  child: GridWidget(
                                    products: state.product!,
                                    cart: null,
                                  ),
                                )
                              ],
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (p, n) => p.status != n.status,
                        builder: (context, state) {
                          if (state.status == StatusEnum.loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state.status == StatusEnum.success) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  GridWidget(
                                    cart: state.cart,
                                    products: null,
                                  ),
                                ],
                              ),
                            );
                          } else if (state.status == StatusEnum.error) {
                            return Center(
                              child: Text(state.message.toString()),
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                      Container(
                        width: size.width,
                        color: Colors.orange,
                        child: Text(' Yuza 3'),
                      ),
                      Container(
                        width: size.width,
                        color: Colors.green,
                        child: Text(' Yuza 4'),
                      ),
                      Container(
                        width: size.width,
                        color: Colors.grey,
                        child: Text(' Yuza 5'),
                      ),
                      Container(
                        width: size.width,
                        color: Colors.green,
                        child: Text(' Yuza 6'),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
