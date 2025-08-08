<?php

namespace App\Models;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;

class PeteSync{

    public static function getTheWPUser(){
        $request = request(); 
        $cookieHeader = $request->header('Cookie', '');
        $wpSite = env('WP_URL');

        $endpoint = "{$wpSite}/wp-json/pete/v1/admin-is-logged-in";
        $loginUrl = "{$wpSite}/wp-login.php?redirect_to=" . urlencode(url()->full());

        $response = Http::withHeaders([
            'Cookie' => $cookieHeader,
        ])->get($endpoint);

        if (! $response->ok()) {
            return false;
        }else{
            $wpUser = $response->json();   
            return $wpUser;
        }
    }

    public static function getTheWPUser(Request $request, Closure $next){
        
        $cookieHeader = $request->header('Cookie', '');
        $wpSite = env('WP_URL');

        $endpoint = "{$wpSite}/wp-json/pete/v1/admin-is-logged-in";
        $loginUrl = "{$wpSite}/wp-login.php?redirect_to=" . urlencode(url()->full());

        $response = Http::withHeaders([
            'Cookie' => $cookieHeader,
        ])->get($endpoint);

        if (! $response->ok()) {
            return false;
        }else{
            $wpUser = $response->json();   
            return $wpUser;
        }
    }

    public static function fetchFromWp(Request $request, string $resource): array
    {
        $cookie = $request->header('Cookie', '');
        $wpUrl  = rtrim(env('WP_URL'), '/');
        $url    = "{$wpUrl}/wp-json/pete/v1/{$resource}";

        try {
            $response = Http::withHeaders([
                'Cookie' => $cookie,
            ])
            // Optional: retry network hiccups automatically
            ->retry(2, 200)          // 2 attempts, 200 ms apart
            ->timeout(5)             // fail fast on slow servers
            ->get($url)
            ->throw();               // let 4xx/5xx bubble into catch block
        } catch (RequestException $e) {
            // Network error OR non-2xx status code
            Log::error('PeteSync » WP call failed', [
                'url'     => $url,
                'message' => $e->getMessage(),
                // Laravel keeps the failed response, if any
                'status'  => optional($e->response)->status(),
                'body'    => optional($e->response)->body(),
                'cookies' => str($cookie)->limit(120),
            ]);

            // Decide how you want to surface the error upstream
            // Throwing lets the controller/middleware decide:
            throw $e;
        }

        return $response->json();
    }

}