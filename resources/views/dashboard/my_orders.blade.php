@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">


            @if(isset($orders["error"]))
                <h3>{{$orders["error"]}}</h3>
            @else

            <div class="card-header bg-white">
                <h5 class="mb-0">WordPress Orders <span class="badge text-bg-light">{{ count($orders) }}</span></h5>
            </div>

            <div class="card-body p-0">
                @if(count($orders))
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Created at</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Currency</th>
                                    <th scope="col">Email</th>
                                    <th scope="col"># Items</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($orders as $order)
                                   <tr>
                                        <td>{{ $order['id'] }}</td>
                                        <td>{{ \Carbon\Carbon::parse($order['date_created'])->format('Y-m-d H:i') }}</td>
                                        <td>{{ ucfirst($order['status']) }}</td>
                                        <td>{{ number_format($order['total'], 2) }}</td>
                                        <td>{{ $order['currency'] }}</td>
                                      
                                        <td>{{ $order['billing_email'] }}</td>
                                    
                                        <td>{{ $order['item_count'] }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @else
                    <div class="alert alert-info m-3">
                        <i class="bi bi-info-circle me-2"></i>No users found.
                    </div>
                @endif

            </div>

            @endif
        </div>
    </div>
@endsection
