// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsNotifierHash() => r'45a802bf7f3c272b8936aec04ffa21848ed007b4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ProductsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<PaginationModel<ProductModel>> {
  late final int page;
  late final String? categoryId;
  late final String? search;

  FutureOr<PaginationModel<ProductModel>> build({
    required int page,
    String? categoryId,
    String? search,
  });
}

/// See also [ProductsNotifier].
@ProviderFor(ProductsNotifier)
const productsNotifierProvider = ProductsNotifierFamily();

/// See also [ProductsNotifier].
class ProductsNotifierFamily
    extends Family<AsyncValue<PaginationModel<ProductModel>>> {
  /// See also [ProductsNotifier].
  const ProductsNotifierFamily();

  /// See also [ProductsNotifier].
  ProductsNotifierProvider call({
    required int page,
    String? categoryId,
    String? search,
  }) {
    return ProductsNotifierProvider(
      page: page,
      categoryId: categoryId,
      search: search,
    );
  }

  @override
  ProductsNotifierProvider getProviderOverride(
    covariant ProductsNotifierProvider provider,
  ) {
    return call(
      page: provider.page,
      categoryId: provider.categoryId,
      search: provider.search,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productsNotifierProvider';
}

/// See also [ProductsNotifier].
class ProductsNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProductsNotifier,
          PaginationModel<ProductModel>
        > {
  /// See also [ProductsNotifier].
  ProductsNotifierProvider({
    required int page,
    String? categoryId,
    String? search,
  }) : this._internal(
         () =>
             ProductsNotifier()
               ..page = page
               ..categoryId = categoryId
               ..search = search,
         from: productsNotifierProvider,
         name: r'productsNotifierProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$productsNotifierHash,
         dependencies: ProductsNotifierFamily._dependencies,
         allTransitiveDependencies:
             ProductsNotifierFamily._allTransitiveDependencies,
         page: page,
         categoryId: categoryId,
         search: search,
       );

  ProductsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.categoryId,
    required this.search,
  }) : super.internal();

  final int page;
  final String? categoryId;
  final String? search;

  @override
  FutureOr<PaginationModel<ProductModel>> runNotifierBuild(
    covariant ProductsNotifier notifier,
  ) {
    return notifier.build(page: page, categoryId: categoryId, search: search);
  }

  @override
  Override overrideWith(ProductsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductsNotifierProvider._internal(
        () =>
            create()
              ..page = page
              ..categoryId = categoryId
              ..search = search,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        categoryId: categoryId,
        search: search,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    ProductsNotifier,
    PaginationModel<ProductModel>
  >
  createElement() {
    return _ProductsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsNotifierProvider &&
        other.page == page &&
        other.categoryId == categoryId &&
        other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductsNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<PaginationModel<ProductModel>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `categoryId` of this provider.
  String? get categoryId;

  /// The parameter `search` of this provider.
  String? get search;
}

class _ProductsNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProductsNotifier,
          PaginationModel<ProductModel>
        >
    with ProductsNotifierRef {
  _ProductsNotifierProviderElement(super.provider);

  @override
  int get page => (origin as ProductsNotifierProvider).page;
  @override
  String? get categoryId => (origin as ProductsNotifierProvider).categoryId;
  @override
  String? get search => (origin as ProductsNotifierProvider).search;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
