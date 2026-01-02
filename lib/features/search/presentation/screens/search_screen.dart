import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_service_card.dart';
import '../providers/search_controller.dart';
import '../../../home/data/models/service_model.dart';

/// Search screen
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchControllerProvider.notifier).loadRecentSearches();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    if (_searchController.text.isNotEmpty) {
      ref.read(searchControllerProvider.notifier).search(
            _searchController.text,
            category: _selectedCategory,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('search.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: AppTextField(
                    controller: _searchController,
                    hint: 'search.search_hint'.tr(),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {},
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: searchState.when(
              data: (state) {
                if (_searchController.text.isEmpty) {
                  return _buildRecentSearches(state);
                }
                return _buildSearchResults(state);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text('common.error'.tr()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearches(state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'search.recent_search'.tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(
                onPressed: () {},
                child: Text('common.clear_all'.tr()),
              ),
            ],
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: state.recentSearches.map<Widget>((search) {
              return Chip(
                label: Text(search),
                onDeleted: () {},
                deleteIcon: const Icon(Icons.close, size: 18),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text(
            'search.recently_viewed'.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          _buildServiceList(state.results),
        ],
      ),
    );
  }

  Widget _buildSearchResults(state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryChips(),
          const SizedBox(height: 16),
          if (state.results.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'search.service_found'.tr(namedArgs: {'count': state.results.length.toString()}),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('common.see_all'.tr()),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildServiceList(state.results),
          ] else
            Center(
              child: Text('search.no_results'.tr()),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ['All Service', 'Cleaning', 'Repairing', 'Painting'];
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategory == category || (category == 'All Service' && _selectedCategory == null);
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = selected ? category : null;
                });
                _performSearch();
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildServiceList(List<ServiceModel> services) {
    return Column(
      children: services.map<Widget>((service) {
        return AppServiceCard(
          title: service.title,
          imageUrl: service.imageUrl,
          location: service.location,
          description: service.description,
          rating: service.rating,
          reviewCount: service.reviewCount,
          priceMin: service.priceMin,
          priceMax: service.priceMax,
          isRecommended: service.isRecommended ?? false,
          onTap: () {
            context.push('/service/${service.id}');
          },
        );
      }).toList(),
    );
  }
}

