import 'package:oversize/features/auth/presentation/auth.dart';
import 'package:oversize/features/category/presentation/widgets/categories_circle.dart';
import 'package:oversize/features/category/presentation/widgets/categories_products.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [CategoriesCircle(), 24.h, CategoriesProducts()],
    );
  }
}
