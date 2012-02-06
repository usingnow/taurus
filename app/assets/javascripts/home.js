for(i=0; i < 6; i++){
  jQuery("#sku_sort_"+i).addClass("highlight")//为当前元素增加highlight类
    .children("a").show().end()//将子节点的a元素显示出来并重新定位到上次操作的元素
    .siblings().removeClass("highlight")//获取元素的兄弟元素，并去掉他们的highlight类
    .children("a").hide();//将兄弟元素下的a元素隐藏
}

jQuery(".has_children").click(function(){
  jQuery(this).addClass("highlight")//为当前元素增加highlight类
  .children("a").show().end()//将子节点的a元素显示出来并重新定位到上次操作的元素
  .siblings().removeClass("highlight")//获取元素的兄弟元素，并去掉他们的highlight类
  .children("a").hide();//将兄弟元素下的a元素隐藏
});