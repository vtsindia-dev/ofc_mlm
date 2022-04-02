@extends($activeTemplate.'layouts.auth')
@section('content')

<section class="account-section">
    <div class="left" style="background-image: url('{{ getImage('assets/images/frontend/auth/'.getContent('auth.content',true)->data_values->image) }}');">
        <div class="left-inner text-center">
            <h3 class="title text-white mt-2">@lang('2FA Verification')</h3>
        </div>
    </div>

    <div class="right">
        <div class="top w-100 text-center">
            <a href="{{route('home')}}" class="account-logo"><img src="{{getImage(imagePath()['logoIcon']['path'] .'/logo.png')}}" alt="@lang('logo')"></a>
        </div>
        <div class="middle w-100">
            <form action="{{route('user.go2fa.verify')}}" method="POST" class="contact-form row mb--25 align-items-center">
            @csrf
                <div class="col-md-12">
                    <div class="contact-form-group">
                        <label for="username">@lang('Verification Code')</label>
                        <input type="text" name="code" maxlength="7" id="code"  placeholder="@lang('Enter Code')" required="">
                    </div>
                </div>

                <div class="col-md-6 pt-3">
                    <div class="contact-form-group">
                        <button type="submit">@lang('Submit')</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="bottom w-100 text-center">
            <p class="text-white">&copy; @lang('All Right Reserved By') <a href="{{route('home')}}" class="text--base">{{__($general->sitename)}}</a></p>
        </div>
    </div>
</section>
@endsection
@push('script')
<script>
    (function($){
        "use strict";
        $('#code').on('input change', function () {
          var xx = document.getElementById('code').value;
          
              $(this).val(function (index, value) {
                 value = value.substr(0,7);
                  return value.replace(/\W/gi, '').replace(/(.{3})/g, '$1 ');
              });
          
      });
    })(jQuery)
</script>
@endpush