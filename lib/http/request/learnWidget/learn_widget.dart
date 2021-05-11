import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
      return CustomItem();
    });
  }
}


class CustomItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      child: PhysicalModel(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                getTagWidget("新"),
                getTagWidget("项目"),
                Text("杨庆"),
                Expanded(
                  child: Container(
                    child: Text("2020-04-25 10:11"),
                    alignment: Alignment.centerRight,
                  ),
                  flex: 1,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://cdn2.jianshu.io/assets/default_avatar/7-0993d41a595d6ab6ef17b19496eb2f21.jpg"),
                    width: 80,
                    height: 60,
                  ),
                  Container(
                    child: Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          Text(
                            "示例项目： 组件化、模块单独运行模块单独运行模块单独运行模块单独运行模块单独运行模块单独运行模块单独运行模块单独运行",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("开源项目主Tab"),
                                Text("/未分类"),
                                Expanded(
                                  child: Container(
                                    child: Icon(Icons.favorite_border),
                                    alignment: Alignment.centerRight,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      padding: EdgeInsets.all(4),
    ));
  }

  Widget getTagWidget(String msg) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.only(top: 1, bottom: 2, right: 4, left: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.blue, width: 1)),
      child: Text(msg),
    );
  }
}
