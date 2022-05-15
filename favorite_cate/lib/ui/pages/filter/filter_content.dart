
import 'package:favorite_cate/core/extension/int_extension.dart';
import 'package:favorite_cate/core/viewmodels/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FCFilterContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildChoiceSelect()
      ],
    );
  }

   Widget _buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text(
        "展示你的选择", 
        style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  // Expanded常用于Row, Column, Flex的子元素中；在使用Expanded子Widget的时候，能够填充满剩余空间。
  Widget _buildChoiceSelect() {
    return Expanded(
      child: Consumer<FCFilterViewModel>(
        builder: (context, filterVM, child) {
          return ListView(
          padding: EdgeInsets.only(top: 10.px),
              children: <Widget>[
                buildListTile("无谷蛋白", "显示无谷蛋白食物", filterVM.isGlutenFree, (value) {
                  filterVM.isGlutenFree = value;
                }),
                buildListTile("不含乳糖", "显示不含乳糖食物", filterVM.isLactoseFree, (value) {
                  filterVM.isLactoseFree = value;
                }),
                buildListTile("素食主义", "显示素食主义食物", filterVM.isVegetarian, (value) {
                  filterVM.isVegetarian = value;
                }),
                buildListTile("严格素食主义", "显示严格素食主义食物", filterVM.isVegan, (value) {
                  filterVM.isVegan = value;
                }),
              ],
            );
        },
      )
    );
  }

   Widget buildListTile(String title, String subtitle, bool value, void Function(bool)? onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(value: value, onChanged: onChange)
    );
  }

}