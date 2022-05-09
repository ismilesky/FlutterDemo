 // 1.自己写Widget
    // 2.某些Widget中会创建RenderObject
    // 3.每一个Widget都会创建一个Element对象
    // 4.1.ComponentElement: mount方法 -> firstBuild -> rebuild -> performBuild -> build -> _widget.build
    // 4.2.RenderObjectElement: mount方法 -> _widget.createRenderObject
    // 4.3.StatefulElement:
    // * 构造方法中 _state = widget.createState()
    // * _state._widget = widget;

    // 所有的Widget都会创建一个对应的Element对象
//    StatelessElement;
//    StatefulElement;


 /**
  Widget只是描述了配置信息：

   其中包含createElement方法用于创建Element
   也包含createRenderObject，但是不是自己在调用
   Element是真正保存树结构的对象：

   创建出来后会由framework调用mount方法；
   在mount方法中会调用widget的createRenderObject对象；
   并且Element对widget和RenderObject都有引用；
   RenderObject是真正渲染的对象：

   其中有markNeedsLayout performLayout markNeedsPaint paint等方法 
  */



    // 组件Widget: 不会生成RenderObject
    // Container -> StatelessWidget -> Widget
//    Container();
//    Text();
//    HYHomeContent();

    // 创建Element: RenderObjectElement
    // 渲染Widget: 生成RenderObject
    // Padding -> SingleChildRenderObjectWidget -> RenderObjectWidget(createRenderObject) -> Widget
    // Padding -> createRenderObject -> RenderPadding -> RenderBox -> RenderObject
//    Padding();
//    RenderObjectWidget