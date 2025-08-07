<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Log;

class AdminWPAuthMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        Log::info("entro en AdminWPAuthMiddleware");

        $cookieHeader = $request->header('Cookie', '');
        $wpSite = env('WP_URL');
        //$wpSite   = config('services.wp.url');
        $endpoint = "{$wpSite}/wp-json/pete/v1/admin-is-logged-in";
        $loginUrl = "{$wpSite}/wp-login.php?redirect_to=" . urlencode(url()->full());

        $response = Http::withHeaders([
            'Cookie' => $cookieHeader,
        ])->get($endpoint);

        if (! $response->ok()) {
            //abort(502, 'Cannot reach WordPress for auth check.');
            return redirect()->away($loginUrl);
        }

        $wpUser = $response->json();            // full payload from Pete Sync
        $roles  = $wpUser['roles'] ?? []; 

        if (empty($wpUser['logged_in']) || !in_array('administrator', $roles, true)) {
            return redirect()->away($loginUrl);
        }

        $request->attributes->set('wp_user', $wpUser);
        $request->attributes->set('wp_roles', $roles);

        Log::info("roles:");
        Log::info($roles);

        return $next($request);
    }
}
