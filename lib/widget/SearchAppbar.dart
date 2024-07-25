import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  final String hintLabel;
  final Function(String) onSubmitted;

  // TextEditingController moved outside of the build method to retain the state.
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  SearchAppBar({Key? key, required this.hintLabel, required this.onSubmitted}) : super(key: key) {
    // Automatically request focus after build
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    MediaQueryData queryData = MediaQuery.of(context);
    return Container(
      // 宽度为屏幕的0.8
      width: queryData.size.width * 0.8,
      // appBar默认高度是56，这里搜索框设置为40
      height: 40,
      // 设置padding
      padding: EdgeInsets.only(left: 5),
      // 设置子级位置
      alignment: Alignment.centerLeft,
      // 设置修饰
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: TextField(
        controller: _controller,
        // 自动获取焦点
        focusNode: _focusNode,
        autofocus: true,
        decoration: InputDecoration(
            hintText: hintLabel,
            hintStyle: TextStyle(color: Colors.grey),
            // 取消掉文本框下面的边框
            border: InputBorder.none,
            icon: Padding(
                padding: const EdgeInsets.only(left: 0, top: 0),
                child: Icon(
                  Icons.search,
                  size: 18,
                  color: Theme.of(context).primaryColor,
                )),
            //  关闭按钮，有值时才显示
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _controller,
              builder: (context, value, child) {
                  return Visibility(
                    visible: value.text.isNotEmpty,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                  );
              },
            )
            ),
        onSubmitted: (value) {
          onSubmitted(value);
        },
      ),
    );
  }
}