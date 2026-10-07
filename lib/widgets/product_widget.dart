import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';

class ProductWidget extends StatefulWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onChanged;

  const ProductWidget({
    super.key,
    required this.product,
    this.onTap,
    this.onChanged,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  void changeQuantity(int value) {
    setState(() => widget.product.quantity += value);
    widget.onChanged?.call();
  }

  void removeProduct() {
    setState(() => widget.product.quantity = 0);
    widget.onChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final formattedPrice = NumberFormat('#,##0', 'en_US').format(product.price);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 125,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.imagePath,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: removeProduct,
                              child: const Icon(
                                Icons.restore_from_trash_outlined,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        product.size,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '\$ $formattedPrice',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              tooltip: 'Decrease quantity',
                              onPressed: product.quantity == 0
                                  ? null
                                  : () => changeQuantity(-1),
                              icon: Icon(
                                Icons.remove,
                                color: product.quantity == 0
                                    ? Colors.black26
                                    : Colors.black87,
                              ),
                              iconSize: 18,
                              visualDensity: VisualDensity.compact,
                              constraints: const BoxConstraints.tightFor(
                                width: 32,
                                height: 32,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            const SizedBox(width: 9),
                            Text(
                              '${product.quantity}',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 9),
                            IconButton(
                              tooltip: 'Increase quantity',
                              onPressed: () => changeQuantity(1),
                              icon: const Icon(Icons.add),
                              iconSize: 18,
                              visualDensity: VisualDensity.compact,
                              constraints: const BoxConstraints.tightFor(
                                width: 32,
                                height: 32,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
