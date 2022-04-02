@extends($activeTemplate.'layouts.master')
@section('content')
@include($activeTemplate.'partials.breadcrumb')
    <div class="dashboard-section my-5 py-md-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                     <div class="referral-input mb-30">
                        <input type="url" id="referralURL" value="{{route('home')}}?reference={{auth()->user()->username}}" readonly="" disabled>
                        <div class="btn btn--info" onclick="myFunction()"><i class="fa fa-files-o"></i>&nbsp;@lang('copy')</div>
                    </div>
                </div>
                <div class="col-md-4 mb-md-4 mb-3">
                    <a href="{{route('user.cart')}}" class="w-100">
                        <div class="dashboard-item card border-0 h-100 p-md-4 mb-0 bs_1 p-3 w-100">
                            <div class="card-body p-0 d-flex justify-content-center align-items-center">                               
                                <div class="media align-items-center">
                                    <div class="dash-icon">
                                      <i class="las la-shopping-cart "></i>
                                    </div>                                
                                    <div class="media-body">
                                        <h6 class="title mt-0">My Cart</h6>
                                    </div>
                                </div>                                                    
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mb-md-4 mb-3">
                    <a href="{{route('user.order')}}" class="w-100">
                        <div class="dashboard-item card border-0 h-100 p-md-4 mb-0 bs_1 p-3">
                            <div class="card-body p-0 d-flex justify-content-center align-items-center">                              
                                <div class="media align-items-center">
                                    <div class="dash-icon">
                                    <i class="lar la-newspaper"></i>
                                    </div>                                
                                    <div class="media-body">
                                        <h6 class="title mt-0">My Orders</h6>
                                    </div>
                                </div>                                           
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mb-md-4 mb-3">
                    <a href="{{route('user.profile.setting')}}" class="w-100">
                        <div class="dashboard-item card border-0 h-100 p-md-4 mb-0 bs_1 p-3">
                            <div class="card-body p-0 d-flex justify-content-center align-items-center">                               
                            
                                <div class="media align-items-center">
                                    <div class="dash-icon">
                                    <i class="las la-user"></i>
                                    </div>                                
                                    <div class="media-body">
                                        <h6 class="title mt-0">My Profile</h6>
                                    </div>
                                </div>                     
                            </div>
                        </div>
                    </a>
                </div>

                <!-- <a href="{{route('user.cart')}}"><button type="button">My Cart</button></a>
                <a href="{{route('user.order')}}"><button type="button">My Orders</button></a>
                <a href="{{route('user.profile.setting')}}"><button type="button">My Profile</button></a> -->
                
                <!-- <div class="col-md-6 col-lg-4 mb-3">
                    <div class="dashboard-item card border-0 h-100 p-md-4 mb-0 bs_1 p-3">
                        <div class="card-body p-0 d-flex justify-content-center align-items-center">
                            <div class="dashboard-thumb">
                                <i class="fas fa-money-bill"></i>
                            </div>
                            <div class="dashboard-content">
                                <h5 class="title">@lang('Current Balance')</h5>
                                <h4 class="amount">{{$general->cur_sym}}{{getAmount(auth()->user()->balance)}}</h4>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 mb-3">
                    <div class="dashboard-item card border-0 h-100 p-md-4 mb-0 bs_1 p-3">
                    <div class="card-body p-0 d-flex justify-content-center align-items-center">
                        <div class="dashboard-thumb">
                            <i class="fas fa-wallet"></i>
                        </div>
                        <div class="dashboard-content">
                            <h5 class="title">@lang('Deposit')</h5>
                            <h4 class="amount">{{$general->cur_sym}}{{getAmount($deposit)}}</h4>
                        </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 mb-3">
                    <div class="dashboard-item card border-0 h-100 p-md-4 mb-0 bs_1 p-3">
                    <div class="card-body p-0 d-flex justify-content-center align-items-center">
                        <div class="dashboard-thumb">
                            <i class="far fa-credit-card"></i>
                        </div>
                        <div class="dashboard-content">
                            <h5 class="title">@lang('Withdraw')</h5>
                            <h4 class="amount">{{$general->cur_sym}}{{getAmount($withdraw)}}</h4>
                        </div>
                    </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 mb-3">
                    <div class="dashboard-item card border-0 h-100 p-md-4 mb-0 bs_1 p-3">
                    <div class="card-body p-0 d-flex justify-content-center align-items-center">
                        <div class="dashboard-thumb">
                           <i class="fas fa-money-check-alt"></i>
                        </div>
                        <div class="dashboard-content">
                            <h5 class="title">@lang('Total Transactions')</h5>
                            <h4 class="amount">{{$transaction}}</h4>
                        </div>
                    </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 mb-3">
                    <div class="dashboard-item card border-0 h-100 p-md-4 mb-0 bs_1 p-3">
                    <div class="card-body p-0 d-flex justify-content-center align-items-center">
                        <div class="dashboard-thumb">
                           <i class="fas fa-money-bill"></i>
                        </div>
                        <div class="dashboard-content">
                            <h5 class="title">@lang('Total Commission')</h5>
                            <h4 class="amount">{{$general->cur_sym}}{{getAmount($commission)}}</h4>
                        </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 mb-3">
                    <div class="dashboard-item card border-0 h-100 p-md-4 mb-0 bs_1 p-3">
                    <div class="card-body p-0 d-flex justify-content-center align-items-center">
                        <div class="dashboard-thumb">
                            <i class="fas fa-coins"></i>
                        </div>
                        <div class="dashboard-content">
                            <h5 class="title">@lang('Total Invest')</h5>
                            <h4 class="amount">{{$general->cur_sym}}{{getAmount($order)}}</h4>
                        </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12 mt-3">
                    <div class="item-rounded card border-0 h-100 bs_1 p-3  table-responsive-md">
                        <table class="deposite-table">
                            <thead class="custom--table ">
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
                                        <td data-label="@lang('TRX')" class="font-weight-bold">{{ $trx->trx }}</td>
                                        <td data-label="@lang('Amount')" class="budget">
                                            <strong @if($trx->trx_type == '+') class="text-success" @else class="text-danger" @endif> {{($trx->trx_type == '+') ? '+':'-'}} {{getAmount($trx->amount)}} {{__($general->cur_text)}}</strong>
                                        </td>
                                        <td data-label="@lang('Charge')" class="budget">{{ __(__($general->cur_sym)) }} {{ getAmount($trx->charge) }} </td>
                                        <td data-label="@lang('Post Balance')">{{ getAmount($trx->post_balance) }} {{__($general->cur_text)}}</td>
                                        <td data-label="@lang('Detail')">{{ __($trx->details) }}</td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                   
                </div> -->                
                <h4 class="font-weight-bold balck mt-2 tree_line">Tree</h4>
                <div class="container">
                    <ul id="org" style="display:none">
                        <li>
                        <label>{{ auth()->user()->username }}</label>
                            {!! $tree["tree_string"] !!}
                        </li>
                    </ul>
                
                    <div id="chart"  class="orgChart" style="overflow-x: hidden;">
                        <!-- <div class="zoom">
                            <span class="zoom_control">+</span>

                            <div id="zoom_slider"></div>
                            <span class="zoom_control">-</span>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
 <!-- referral tree -->
</section>
<!-- referral tree -->    
@push('script')
    <script>
        $(document).ready(function () {

        $("#org").jOrgChart({
            chartElement: '#chart',
            dragAndDrop: false,
            slider: true
        });

        $('#chart .cgsnode').tooltip();

        $('#chart').kinetic();
        });
    </script>
    <script>
        "use strict";
        function myFunction() {
            var copyText = document.getElementById("referralURL");
            copyText.select();
            copyText.setSelectionRange(0, 99999);
            document.execCommand("copy");
            iziToast.success({message: "Referral Url Copied: " + copyText.value, position: "topRight"});
        }
    </script>
@endpush
@endsection