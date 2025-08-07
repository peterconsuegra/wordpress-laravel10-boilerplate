<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redirect;
use View;
use App\Models\PeteSync;
use Log;

class AdminController extends Controller
{
    public function __construct(Request $request){

		$wordpress_url  = env('WP_URL');
		View::share(compact('wordpress_url'));
	
	}

    public function users(Request $request)
    {
        $viewsw = "users";
        $roles = $request->attributes->get('wp_roles');
        $users = PeteSync::fetchFromWp($request, 'users');
        return view('admin.users', compact('users','viewsw','roles'));
    }

    public function posts(Request $request)
    {
        $viewsw = "posts";
        $roles = $request->attributes->get('wp_roles');
        $posts = PeteSync::fetchFromWp($request, 'posts');
        return view('admin.posts', compact('posts','viewsw','roles'));
    }

    public function products(Request $request)
    {
        $viewsw = "products";
        $roles = $request->attributes->get('wp_roles');
        $products = PeteSync::fetchFromWp($request, 'products');
        return view('admin.products', compact('products','viewsw','roles'));
    }

    public function orders(Request $request)
    {
        $viewsw = "orders";
        $roles = $request->attributes->get('wp_roles');
        $orders = PeteSync::fetchFromWp($request, 'orders');
        return view('admin.orders', compact('orders','viewsw','roles'));
    }

    public function subscriptions(Request $request)
    {
        $viewsw = "subscriptions";
        $roles = $request->attributes->get('wp_roles');
        $subscriptions = PeteSync::fetchFromWp($request, 'subscriptions');
        return view('admin.subscriptions', compact('subscriptions','viewsw','roles'));
    }

}
