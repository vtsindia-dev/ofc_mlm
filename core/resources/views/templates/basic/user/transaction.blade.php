@extends($activeTemplate.'layouts.master')
@section('content')
@include($activeTemplate.'partials.breadcrumb')
<div class="transaction-section my-5 cart-table table-responsive">
     <div class="container">
            <div class=" mb-2 item-rounded">
                <table class="deposite-table">
                    <thead class="custom--table">
                        <tr>
                            <th>@lang('Date')</th>
                            <th>@lang('TRX')</th>
                            <th>@lang('Amount')</th>
                            <th>@lang('Charge')</th>
                            <th>@lang('Post Balance')</th>
                            <th>@lang('Detail')</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($transactions as $trx)
                            <tr>
                                <td data-label="@lang('Date')">
                                    {{ showDateTime($trx->created_at) }}
                                    <br>
                                    {{diffforhumans($trx->created_at)}}
                                </td>

                                <td data-label="@lang('TRX')" class="font-weight-bold">
                                    {{ $trx->trx }}
                                </td>

                                <td data-label="@lang('Amount')">
                                    <strong @if($trx->trx_type == '+') class="text-success" @else class="text-danger" @endif> {{($trx->trx_type == '+') ? '+':'-'}} {{getAmount($trx->amount)}} {{__($general->cur_text)}}</strong>
                                </td>

                                <td data-label="@lang('Charge')">
                                    {{getAmount($trx->charge)}} {{__($general->cur_text)}} 
                                </td>
                                <td data-label="@lang('Post Balance')">
                                    {{getAmount($trx->post_balance)}} {{__($general->cur_text)}}</td>
                                <td data-label="@lang('Detail')">
                                    {{__($trx->details)}}
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="100%">{{ __($emptyMessage) }}</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            {{$transactions->links()}}
            </div>
        </div>
    </div>
@endsection



