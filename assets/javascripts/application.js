//= require jquery/dist/jquery.min
//= require foundation/js/foundation.min
//= require moment/moment
//= require moment/lang/es
//= require angular/angular.min
//= require angular-moment/angular-moment.min
//= require_self

$(function(){
  $(".js-logout").on('click', function(){
    $("form.logout-form").submit();
  });
});