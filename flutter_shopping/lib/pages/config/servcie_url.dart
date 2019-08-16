// const serviceUrl='https://api.topiom.com';
// const servicePath={
//  'homePageContext':serviceUrl+'/api/cms/homepage/activity',//首页信息
// //  'homepage':serviceUrl+'/api/cms/homepage/activity',
// 'homepage':serviceUrl+'/api/cms/homepage/pageinfo',
// 'productList':'https://zhuanlan.zhihu.com/api/columns/zhihuadminA',
// };
const serviceUrl = 'http://v.jspang.com:8088/baixing/';
const servicePath = {
  'homePageContent': serviceUrl + 'wxmini/homePageContent', //商店首页信息
  'homePageBelowConten': serviceUrl + 'wxmini/homePageBelowConten', //商店首页热卖商品
  'getCategory': serviceUrl+'wxmini/getCategory', //商品类别信息
  'getMallGoods': serviceUrl+'wxmini/getMallGoods', //商品分类的商品列表
  'getGoodDetailById': serviceUrl+'wxmini/getGoodDetailById', //商品详情
};
