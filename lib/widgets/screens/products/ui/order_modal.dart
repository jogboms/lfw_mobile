import 'package:flutter/material.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_primary_button.dart';
import 'package:glam/widgets/screens/products/ui/color_size_drop.dart';
import 'package:glam/widgets/screens/products/ui/info_block.dart';

class OrderModal extends StatefulWidget {
  const OrderModal({
    Key key,
  }) : super(key: key);

  @override
  OrderModalState createState() => new OrderModalState();
}

class OrderModalState extends State<OrderModal> {
  TextStyle _formStyle;

  @override
  Widget build(BuildContext context) {
    _formStyle = MkTheme.of(context).textfield;

    return SafeArea(
      top: false,
      child: new Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              const InfoBlock(
                contentPadding: const EdgeInsets.symmetric(
                  // horizontal: 16.0,
                  vertical: 8.0,
                ),
              ),
              const Divider(),
              const ColorSizeDrop(),
              const Divider(),
              SizedBox(height: 16.0),
              _buildTextFormField(
                hintText: "Website",
              ),
              SizedBox(height: 24.0),
              _buildTextFormField(
                hintText: "Bio",
                maxLines: 4,
              ),
              SizedBox(height: 32.0),
              Text(
                "Note that your order is complete only when the vendor has confirmed the order, payment and delivery details via email or phone.",
                style: MkTheme.of(context).bodyHint,
              ),
              SizedBox(height: 32.0),
              MkPrimaryButton(
                onPressed: () {},
                child: Text("Order Now"),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    String hintText,
    int maxLines = 1,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: _formStyle.copyWith(
          color: kHintColor,
        ),
        contentPadding: EdgeInsets.only(bottom: 24.0),
      ),
      style: _formStyle,
      maxLines: maxLines,
    );
  }
}
