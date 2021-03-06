// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails_hydration
//= require jquery
//= require jquery_ujs

//= require jquery.min
//= require jquery.scrollex.min
//= require jquery.scrolly.min

$(document).ready(function() {
  $(".input-button-style").hover(function() {
    $(this).removeClass("input-button-style");
    $(this).addClass("button-hover");
  }, function() {
    $(this).removeClass("button-hover");
    $(this).addClass("input-button-style");
  });
});
