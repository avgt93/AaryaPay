import 'package:aaryapay/components/CircularLoadingAnimation.dart';
import 'package:aaryapay/constants.dart';
import 'package:aaryapay/global/authentication/authentication_bloc.dart';
import 'package:aaryapay/global/bloc/data_bloc.dart';
import 'package:aaryapay/helper/utils.dart';
import 'package:aaryapay/repository/favourites.dart';
import 'package:aaryapay/screens/Home/components/bloc/home_favorites_bloc.dart';
import 'package:aaryapay/screens/Send/send_money.dart';
import 'package:aaryapay/screens/Settings/Favourites/favourites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<DataBloc, DataState>(
      listener: (context, dataState) {
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, dataState) {
        return Container(
          width: size.width,
          margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Favorites",
                    style: textTheme.titleLarge,
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTapDown: (details) =>
                            Utils.mainAppNav.currentState!.push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const FavouritesScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final curve = CurvedAnimation(
                                parent: animation,
                                curve: Curves.decelerate,
                              );

                              return Stack(
                                children: [
                                  FadeTransition(
                                    opacity: Tween<double>(
                                      begin: 1.0,
                                      end: 0.0,
                                    ).animate(curve),
                                  ),
                                  SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0.0, 1.0),
                                      end: Offset.zero,
                                    ).animate(curve),
                                    child: FadeTransition(
                                      opacity: Tween<double>(
                                        begin: 0.0,
                                        end: 1.0,
                                      ).animate(curve),
                                      child: const FavouritesScreen(),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/plus.svg",
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.onBackground,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "Add Favorite",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      if (dataState.isReady && dataState.favorites.isNotEmpty)
                        ...dataState.favorites
                            .map(
                              (item) => BlocProvider(
                                create: (context) => HomeFavoritesBloc(),
                                child: BlocConsumer<HomeFavoritesBloc,
                                    HomeFavoritesState>(
                                  listener: (context, state) {
                                    if (state.particularUser != null) {
                                      Utils.mainAppNav.currentState!.push(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              SendMoney(
                                            uuid: state.particularUser!['id'],
                                            firstname: state
                                                .particularUser!['first_name'],
                                            lastname: state
                                                .particularUser!['last_name'],
                                            displayAmount: state.displayAmount!,
                                          ),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            final curve = CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.decelerate,
                                            );

                                            return Stack(
                                              children: [
                                                FadeTransition(
                                                  opacity: Tween<double>(
                                                    begin: 1.0,
                                                    end: 0.0,
                                                  ).animate(curve),
                                                ),
                                                SlideTransition(
                                                  position: Tween<Offset>(
                                                    begin:
                                                        const Offset(0.0, 1.0),
                                                    end: Offset.zero,
                                                  ).animate(curve),
                                                  child: FadeTransition(
                                                    opacity: Tween<double>(
                                                      begin: 0.0,
                                                      end: 1.0,
                                                    ).animate(curve),
                                                    child: SendMoney(
                                                      uuid:
                                                          state.particularUser![
                                                              'id'],
                                                      firstname:
                                                          state.particularUser![
                                                              'first_name'],
                                                      lastname:
                                                          state.particularUser![
                                                              'last_name'],
                                                      displayAmount: dataState
                                                          .balance
                                                          .toString(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    return GestureDetector(
                                      onTapDown: (details) => context
                                          .read<HomeFavoritesBloc>()
                                          .add(
                                            LoadParticularUser(
                                              uuid: item.id.toString(),
                                              favorites: dataState.favorites,
                                            ),
                                          ),
                                      onTap: () => context
                                          .read<HomeFavoritesBloc>()
                                          .add(ClearEvent()),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            imageLoader(
                                              imageUrl: item.id.toString(),
                                              shape: ImageType.circle,
                                              width: 80,
                                              height: 80,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Text(
                                                "${item.firstName} ${item.lastName.length + item.firstName.length > 10 ? "" : item.lastName}",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                            .toList()
                            .reversed,
                      if (!dataState.isLoaded && dataState.favorites.isEmpty)
                          Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 30),
                                child: const CircularLoadingAnimation(width: 80, height: 80),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              )
                            ],
                          ),
                        ),
                        
                                            ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
