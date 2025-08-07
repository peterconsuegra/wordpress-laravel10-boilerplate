<?php

use Illuminate\Support\Facades\Route;
use App\Models\PeteSync;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\AdminController;

Route::get('/', function (Request $request) {

    $wp_user = PeteSync::getTheWPUser();
    $roles  = $wp_user['roles'] ?? []; 
    $wpSite = env('WP_URL');
    
    if($wp_user == false){
        return redirect("$wpSite/my-account");
    }

    if(in_array('administrator', $roles, true)){
       return redirect('/users');
    }else{
        return redirect('/my_subscriptions');
    }

});

Route::middleware(['web', 'auth.wp'])->group(function () {

    Route::get('my_orders', [DashboardController::class,'my_orders']);
    Route::get('my_subscriptions', [DashboardController::class,'my_subscriptions']);

});

Route::middleware(['web', 'admin.wp'])->group(function () {

    Route::get('orders', [AdminController::class,'orders']);
    Route::get('posts', [AdminController::class,'posts']);
    Route::get('users', [AdminController::class,'users']);
    Route::get('products', [AdminController::class,'products']);
    Route::get('subscriptions', [AdminController::class,'subscriptions']);

});