@extends('layout')

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
        
            @if(isset($subscriptions["error"]))
                <h3>{{$subscriptions["error"]}}</h3>
            @else

                <div class="card-header bg-white">
                    <h5 class="mb-0">WordPress Subscriptions <span class="badge text-bg-light">{{ count($subscriptions) }}</span></h5>
                </div>

                <div class="card-body p-0">
                    @if(count($subscriptions))
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
                                    @forelse($subscriptions as $subscription)
                                    <tr>
                                            <td>{{ $subscription['id'] }}</td>
                                            <td>{{ \Carbon\Carbon::parse($subscription['date_created'])->format('Y-m-d H:i') }}</td>
                                            <td>{{ ucfirst($subscription['status']) }}</td>
                                            <td>{{ number_format($subscription['total'], 2) }}</td>
                                            <td>{{ $subscription['currency'] }}</td>
                                        
                                            <td>{{ $subscription['billing_email'] }}</td>
                                        
                                            <td>{{ $subscription['item_count'] }}</td>
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

                @endif
            </div>
        </div>
    </div>
@endsection