import 'dart:convert';

import 'package:coupon_find/Models/coupons_model.dart';
import 'package:http/http.dart' as http;

class Services {
	static const String url = "https://still-plateau-33433.herokuapp.com/index";

	static Future<List<CouponModel>>  getCoupons() async{
		http.Response response =await http.get(url);
		String content =response.body;
		List collection =json.decode(content);
		List<CouponModel> _coupons =collection.map((json)=>CouponModel.fromJson(json)).toList();
	return _coupons;
	}

	static Future<List<CouponModel>>  getCouponsFiltred(query) async{
		http.Response response =await http.get(url);
		String content =response.body;
		List collection =json.decode(content);
		Iterable<CouponModel> _coupons =collection.map((json)=>CouponModel.fromJson(json)) ;
		if(query !=null && query.isNotEmpty){
_coupons=_coupons.where((coupons)=>coupons.storeName ==query);
		}
		return _coupons.toList();
	}

	static Future editCount(id,storeId) async{
		String url = "http://still-plateau-33433.herokuapp.com/api/coupons/$id";
		final response =await http.put(url,body: { 'storeId':'$storeId' } );
		if (response.statusCode  == 200) {
			return response;
		}else
		{ print("not updated"); }
	}



}
