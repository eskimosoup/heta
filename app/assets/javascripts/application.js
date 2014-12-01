// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation

//= require fullcalendar

$(function(){ $(document).foundation(); });

$(document).foundation('orbit', {
  animation: 'fade',
  timer_speed: 5000,
  pause_on_hover: true,
  resume_on_mouseout: true,
  animation_speed: 1000,
  stack_on_small: false,
  navigation_arrows: true,
  slide_number: false,
  container_class: 'orbit-container',
  stack_on_small_class: 'orbit-stack-on-small',
  next_class: 'orbit-next',
  prev_class: 'orbit-prev',
  timer_container_class: 'orbit-timer',
  timer_paused_class: 'paused',
  timer_progress_class: 'orbit-progress',
  slides_container_class: 'orbit-slides-container',
  bullets_container_class: 'orbit-bullets',
  bullets_active_class: 'active',
  slide_number_class: 'orbit-slide-number',
  caption_class: 'orbit-caption',
  active_slide_class: 'active',
  orbit_transition_class: 'orbit-transitioning',
  bullets: false,
  timer: true,
  next_on_click: false,
  variable_height: false,
  before_slide_change: function(){},
  after_slide_change: function(){}
});

$(document).foundation('reveal', {
  animation: 'fade',
  animationspeed: 2000
});

$(document).on('opened', '.reveal-modal.gallery-modal', function () {
  var modal = $(this);

  var imgWidth = $('.reveal-modal.gallery-modal .image-show').width();
  var containerWidth = $(this).width();

  $('.reveal-modal-inner-gallery').width( ( Math.round( imgWidth / containerWidth * 100 ) + 1 ) + '%' );
  //$('.reveal-modal-inner-gallery').addClass( 'reveal-modal-inner-shadow', 3500 );
  $('.close-reveal-modal').fadeIn('slow');
});

$(document).ready(function() {


  //Accordion
  $('a.accordion-button').click(function() {
    $('div.accordion-content').slideUp('normal');
    $(this).siblings().removeClass('active');
    if($(this).hasClass('active')) {
      $(this).next().slideUp('normal');
      $(this).removeClass("active");
    } else {
      $(this).addClass("active");
      $(this).next().slideDown('normal');
    }
  });

  $("div.accordion-content").hide();



//----------------------------------------------------
//  Mobile Navigation
//------------------------------------------------------

  $(".mobile-menu").click(function(){
    if($('.mobile-menu-list').hasClass('hidden')) {
      $('.mobile-menu-list').animate({right:0},500).removeClass('hidden');
    } else {
      $('.mobile-menu-list').animate({right:'-90%'},500).addClass('hidden');
    }
  });


  $(".children").click(function() {
    if($(this.hash).hasClass('closed')) {
      $(this).siblings().slideDown().removeClass('closed');
    } else {
      $(this).siblings().not('div').slideUp().addClass('closed');
    }
    return false;
  });


});

$(".accordion-button").hover(
    function () {
      $(this).addClass("hover");
    },
    function () {
      $(this).removeClass("hover");
    }
);
