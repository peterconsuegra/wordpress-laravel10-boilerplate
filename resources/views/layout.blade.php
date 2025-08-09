<!doctype html>
<html lang="{{ str_replace('http://dashboard.wordpresspete.petelocal.net/oupdates_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>WordPress Pete Dashboard</title>

    <!-- Bootstrap 5.3.7 & Icons (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom styles (optional) -->
    <style>

       /* Pete dashboard buttons */
.btn-pete {
    /* base state */
    --bs-btn-hover-color: #fff;   /* keep Bootstrap happy */
    --bs-btn-active-color: #fff;
    background-image: linear-gradient(135deg, #0D274D 0%, #003B24 100%);
    color: #fff;
    font-weight: 600;
    border: none;
    padding: 0.55rem 1.25rem;
    border-radius: 0.5rem;
    box-shadow: 0 4px 10px rgba(0,0,0,.25);
    transition: transform .15s ease, box-shadow .15s ease;
}

.btn-pete:hover,
.btn-pete:focus {
    /* keep the text white on rollover */
    color: #fff;                  /* <-- critical line */
    transform: translateY(-2px);
    box-shadow: 0 6px 14px rgba(0,0,0,.35);
    text-decoration: none;
}

.btn-pete:active {
    color: #fff;                  /* make sure it stays white when pressed */
    transform: translateY(0);
    box-shadow: 0 3px 8px rgba(0,0,0,.2);
}

        #sidebar {
             min-width: 180px;
        }
        /* Sidebar */
        .sidebar-link.active {
            background-color: #0D274D;
            font-weight: 600;
        }
        .sidebar-link i {
            width: 1.2rem;
        }
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
		.navbar{

			/* 1️⃣ Solid fallback for very old browsers */
			background-color: #0D274D;

			/* 2️⃣ Modern browsers */
			background-image: linear-gradient(90deg, #0D274D 0%, #003B24 100%);

			background-repeat: no-repeat;
			background-size: cover;
		}
        main {
            flex: 1 1 auto;
        }
    </style>

    @stack('head')
</head>
<body class="bg-light">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center gap-2" href="/">
            Your Logo
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar" aria-label="Toggle sidebar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="{{ $wordpress_url ?? '#' }}/my-account">My Account</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="d-flex">
    <!-- SIDEBAR -->
    <div class="offcanvas-lg offcanvas-start bg-white border-end" tabindex="-1" id="sidebar" aria-labelledby="sidebarLabel">
        <div class="offcanvas-header border-bottom">
            <h5 class="offcanvas-title" id="sidebarLabel">Menu</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" data-bs-target="#sidebar" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body p-0">
            @php
                $roles = $roles ?? [];
            @endphp
            <nav class="list-group list-group-flush">
                @if(in_array('administrator', $roles, true))
                    <a href="{{$link_route_fix}}/users"       class="list-group-item list-group-item-action sidebar-link @if($viewsw==='users') active @endif"><i class="bi bi-people"></i> WordPress Users</a>
                    <a href="{{$link_route_fix}}/orders"      class="list-group-item list-group-item-action sidebar-link @if($viewsw==='orders') active @endif"><i class="bi bi-person-vcard"></i> WooCommerce Orders</a>
                    <a href="{{$link_route_fix}}/subscriptions"       class="list-group-item list-group-item-action sidebar-link @if($viewsw==='subscriptions') active @endif"><i class="bi bi-gear"></i> WooCommerce Subscriptions</a>
                    <a href="{{$link_route_fix}}/posts"    class="list-group-item list-group-item-action sidebar-link @if($viewsw==='posts') active @endif"><i class="bi bi-plug"></i> WordPress Posts</a>
                    <a href="{{$link_route_fix}}/products"      class="list-group-item list-group-item-action sidebar-link @if($viewsw==='products') active @endif"><i class="bi bi-wordpress"></i> WooCommerce Products</a>
                @else
                    <a href="{{$link_route_fix}}/my_subscriptions" class="list-group-item list-group-item-action sidebar-link @if($viewsw==='my_subscriptions') active @endif"><i class="bi bi-card-checklist"></i> My subscriptions</a>
                    <a href="{{$link_route_fix}}/my_orders" class="list-group-item list-group-item-action sidebar-link @if($viewsw==='my_orders') active @endif"><i class="bi bi-card-checklist"></i> My Orders</a>
                @endif
            </nav>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <main class="flex-fill p-4">
        @yield('header')
        @yield('content')
    </main>
</div>

<!-- FOOTER -->
<footer class="py-3 bg-white border-top small text-center">
     Your Custom WordPress + Laravel Dashboard © . {{ now()->year }}
</footer>

<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
@stack('scripts')
</body>
</html>
