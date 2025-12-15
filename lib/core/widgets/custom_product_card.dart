import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/product.dart';
import 'package:route_e_commerce_v2/features/orders/presentation/orders_contract.dart';
import 'package:route_e_commerce_v2/features/orders/presentation/orders_cubit.dart';

class CustomProductCard extends StatelessWidget {
  final Product product;
  final OrdersCubit ordersCubit = getIt();

  CustomProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return BlocProvider.value(
      value: ordersCubit,
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          bool isInCart = false;
          try {
            print(state.cart.data?.products);
            var productInCart = (state.cart.data?.products ?? []).firstWhere(
                  (element) => element.id == product.id,
            );
            isInCart = true;
          } catch (e) {
            isInCart = false;
          }
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: .3),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              product.imageCover ??
                              'https://ecommerce.routemisr.com/Route-Academy-products/1678303324588-cover.jpeg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${product.title ?? 'Unknown Product'}\n",
                            style: textTheme.headlineSmall,
                            maxLines: 2,
                          ),

                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'EGP ${product.priceAfterDiscount ?? 0} ',
                                style: textTheme.headlineSmall,
                              ),
                              Text(
                                " ${product.price ?? 0}",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(
                                  color: colorScheme.primary.withValues(
                                    alpha: .6,
                                  ),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 4,
                                children: [
                                  Text(
                                    'Review (${product.ratingsAverage?.toStringAsFixed(1) ?? 0})',
                                    style: textTheme.headlineSmall,
                                  ),
                                  SvgPicture.asset(AppSvgs.ratingIcon),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  // TODO: Implement add to cart functionality
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  visualDensity: VisualDensity.compact,
                                  shape: const CircleBorder(),
                                ),
                                icon: Icon(
                                  isInCart ? Icons.delete : Icons.add_rounded,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () {
                      //TODO: Implement favorite toggle functionality
                    },
                    child: CircleAvatar(
                      backgroundColor: colorScheme.onPrimary,
                      child: SvgPicture.asset(
                        AppSvgs.inactiveFavoriteIcon,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
