import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_pagination_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/values/app_assets.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../notifiers/products_notifier.dart';
import '../widgets/product_widget.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final searchController = useTextEditingController();
    final searchText = useState("");
    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, [0]);
    return Scaffold(
      appBar: AppBar(title:  Text('search').tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            CustomTextField(
              focusNode: focusNode,
              onChange: (value) {
                searchText.value = value;
              },

              controller: searchController,
              hintText: "search_products_categories".tr(),
              prefixIcon: AppIcons.search,
            ),
            10.vertical,
            Expanded(
              child: CustomPaginationWidget(
                refreshers: [searchText],
                itemBuilder: (item) {
                  return ProductWidget(model: item);
                },
                getItems: (page) async {
                  return await ref.read(
                    productsNotifierProvider(
                      page: page,
                      search: searchText.value,
                    ).future,
                  );
                },
                isListView: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
