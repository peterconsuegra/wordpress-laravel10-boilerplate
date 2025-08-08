<?php

use Illuminate\Support\Facades\Route;
use App\Models\PeteSync;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\AdminController;

Route::get('/', function (Request $request) {
    
    $logged_in_as = PeteSync::checkTheTypeOfLoggedIn();

    if($logged_in_as === "loggedInAsAdmin"){
       return redirect('/users');
    }else if($logged_in_as === "loggedInAsUser"){
        return redirect('/my_subscriptions');
    }else{
         return redirect(env('WP_URL_LOGIN'));
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