import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/constants/ads/my_products_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/ads/view/pages/product_details_page/product_details_page.dart';
import 'package:rent_hub/features/ads/view/widgets/my_product_card/my_product_card_widget.dart';

final List<dynamic> myProductsList = [
  [
    'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
    'BMW 5 series',
    1500.00,
    5,
    5,
  ],
  [
    'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
    'BMW 5 series',
    1500.00,
    5,
    5,
  ],
  [
    'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
    'BMW 5 series',
    1500.00,
    5,
    5,
  ],
  [
    'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
    'BMW 5 series',
    1500.00,
    5,
    5,
  ],
  [
    'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
    'BMW 5 series',
    1500.00,
    5,
    5,
  ],
];

class MyProductsPage extends ConsumerWidget {
  static const routePath = '/myProducts';
  // final Function() myProductsonTap;
  const MyProductsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            // TODO : navigate pop
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          ref.watch(myProductsConstantsProvider).txtAppBarTitle,
        ),
        titleTextStyle: context.typography.h2Bold,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(
          top: context.spaces.space_200,
          left: context.spaces.space_200,
          right: context.spaces.space_200,
        ),
        itemBuilder: (context, index) => MyProductCardWidget(
          myProductsOnTap: () {
            context.push(ProductDetailsPage.routePath);
          },
          Productimage: myProductsList[index][0],
          productName: myProductsList[index][1],
          poductPrice: myProductsList[index][2],
          views: myProductsList[index][3],
          likes: myProductsList[index][4],
          onSelected: (value) {
            // TODO: popmenu button operation
          },
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: context.spaces.space_200,
        ),
        itemCount: myProductsList.length,
      ),
    );
  }
}
