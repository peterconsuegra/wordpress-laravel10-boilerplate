{{-- resources/views/admin/products.blade.php --}}
@extends('layout')

@section('header')
    {{-- Optional page-specific header --}}
@endsection

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">

            @if(isset($products["error"]))
                <h3>{{$products["error"]}}</h3>
            @else

            <div class="card-header bg-white">
                <h5 class="mb-0">
                    WooCommerce Products
                    <span class="badge text-bg-light">{{ count($products) }}</span>
                </h5>
            </div>

            <div class="card-body p-0">
                @if(count($products))
                    <div class="table-responsive">
                        <table class="table table-hover table-striped align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col" class="text-nowrap">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">SKU</th>
                                    <th scope="col" class="text-end">Price</th>
                                    <th scope="col" class="text-end">Regular&nbsp;Price</th>
                                    <th scope="col" class="text-end">Sale&nbsp;Price</th>
                                    <th scope="col">Link</th>
                                    <th scope="col">Image</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($products as $prod)
                                    <tr>
                                        <td>{{ $prod['id'] }}</td>
                                        <td>{{ $prod['name'] }}</td>
                                        <td>{{ $prod['sku'] }}</td>
                                        <td class="text-end">{{ $prod['price'] }}</td>
                                        <td class="text-end">{{ $prod['regular_price'] }}</td>
                                        <td class="text-end">{{ $prod['sale_price'] ?: '—' }}</td>
                                        <td>
                                            <a href="{{ $prod['permalink'] }}" target="_blank" rel="noopener">
                                                View&nbsp;product
                                            </a>
                                        </td>
                                        <td>
                                            @if($prod['image'])
                                                <img src="{{ $prod['image'] }}" alt="{{ $prod['name'] }}" style="max-height:50px">
                                            @else
                                                —
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @else
                    <div class="alert alert-info m-3">
                        <i class="bi bi-info-circle me-2"></i>No products found.
                    </div>
                @endif

                @endif
            </div>
        </div>
    </div>
@endsection
