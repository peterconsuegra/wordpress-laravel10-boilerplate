<?php

namespace App\Http\Controllers;

use App\Standard\Generator;
use App\Standard\License;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;
use Log;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use View;
use Illuminate\Support\Facades\Http;
use App\Models\PeteSync;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
	
	public function __construct(Request $request){

		$wordpress_url  = env('WP_URL');

        if (env('WP_INTEGRATION') == "inside_wordpress"){
            $link_route_fix = "/".env('WP_LARAVEL_NAME');
        }else{
            $link_route_fix="";
        }

		View::share(compact('wordpress_url','link_route_fix'));
	
	}

	public function my_orders(Request $request){
        $roles = $request->attributes->get('wp_roles');
		$wp_user = $request->attributes->get('wp_user');
		$user_id = $wp_user['user_id'];
		$viewsw = "my_orders";
		$orders = PeteSync::fetchFromWp($request, "user-orders/$user_id");
		return view('dashboard.my_orders',compact('viewsw','orders','roles'));
	}

	public function my_subscriptions(Request $request){
		$roles = $request->attributes->get('wp_roles');
		$wp_user = $request->attributes->get('wp_user');
		$user_id = $wp_user['user_id'];
		$viewsw = "my_subscriptions";
		$subscriptions = PeteSync::fetchFromWp($request, "user-subscriptions/$user_id");
		return view('dashboard.my_subscriptions',compact('viewsw','subscriptions','roles'));
	}
   
}
