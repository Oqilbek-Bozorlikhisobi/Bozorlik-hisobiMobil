// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesNotifierHash() =>
    r'6f7fc4ec344b32951b23bad8d36629f56ac23d8b';

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

abstract class _$CategoriesNotifier
    extends BuildlessAutoDisposeAsyncNotifier<PaginationModel<CategoryModel>> {
  late final int page;

  FutureOr<PaginationModel<CategoryModel>> build({required int page});
}

/// See also [CategoriesNotifier].
@ProviderFor(CategoriesNotifier)
const categoriesNotifierProvider = CategoriesNotifierFamily();

/// See also [CategoriesNotifier].
class CategoriesNotifierFamily
    extends Family<AsyncValue<PaginationModel<CategoryModel>>> {
  /// See also [CategoriesNotifier].
  const CategoriesNotifierFamily();

  /// See also [CategoriesNotifier].
  CategoriesNotifierProvider call({required int page}) {
    return CategoriesNotifierProvider(page: page);
  }

  @override
  CategoriesNotifierProvider getProviderOverride(
    covariant CategoriesNotifierProvider provider,
  ) {
    return call(page: provider.page);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoriesNotifierProvider';
}

/// See also [CategoriesNotifier].
class CategoriesNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          CategoriesNotifier,
          PaginationModel<CategoryModel>
        > {
  /// See also [CategoriesNotifier].
  CategoriesNotifierProvider({required int page})
    : this._internal(
        () => CategoriesNotifier()..page = page,
        from: categoriesNotifierProvider,
        name: r'categoriesNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$categoriesNotifierHash,
        dependencies: CategoriesNotifierFamily._dependencies,
        allTransitiveDependencies:
            CategoriesNotifierFamily._allTransitiveDependencies,
        page: page,
      );

  CategoriesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  FutureOr<PaginationModel<CategoryModel>> runNotifierBuild(
    covariant CategoriesNotifier notifier,
  ) {
    return notifier.build(page: page);
  }

  @override
  Override overrideWith(CategoriesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoriesNotifierProvider._internal(
        () => create()..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    CategoriesNotifier,
    PaginationModel<CategoryModel>
  >
  createElement() {
    return _CategoriesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoriesNotifierProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoriesNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<PaginationModel<CategoryModel>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _CategoriesNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          CategoriesNotifier,
          PaginationModel<CategoryModel>
        >
    with CategoriesNotifierRef {
  _CategoriesNotifierProviderElement(super.provider);

  @override
  int get page => (origin as CategoriesNotifierProvider).page;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
