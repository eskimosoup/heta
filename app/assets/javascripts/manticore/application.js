// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require tinymce-jquery
//= require chronicler/application
//= require_self

$(function() { $( ".datepicker" ).datepicker({dateFormat: 'dd-mm-yy'}); });

tinyMCE.init({
    selector: 'textarea.tinymce',
    theme: 'modern',
    plugins: 'media mantimage mantlink code textcolor paste emoticons',
    content_css: '/assets/core.css',
    menubar: 'edit insert view format tools',
    toolbar1: 'styleselect | bold italic underline strikethrough | alignleft aligncenter alignright | superscript subscript | bullist numlist outdent indent | link image',
//    toolbar2: 'columns',
    setup: function(editor) {
      editor.addButton('columns', {
        type: 'menubutton',
        text: 'Column Select',
        icon: false,
        /*menu: [
          {text: '2 Columns', onclick: function() {editor.insertContent('<div class="row"><div class="large-6 columns admin-column-2">&nbsp;</div><div class="large-6 columns admin-column-2"></div></div>');}},
          {text: '3 Columns', onclick: function() {editor.insertContent('<div class="row"><div class="large-4 columns admin-column-3">&nbsp;</div><div class="large-4 columns admin-column-3"></div><div class="large-4 columns admin-column-3"></div></div>');}}
        ]*/
      });
    },

    link_list: '/admin/documents.js',
    image_list: '/admin/images.js',
    style_formats: [
    { block: 'h1',  title: 'Header 1' },
    { block: 'h2',  title: 'Header 2' },
    { block: 'h3',  title: 'Header 3' },
    { block: 'h4',  title: 'Header 4' },
    { title: 'Image Left', selector: 'img', attributes: { class: 'image-left' }},
    { title: 'Image Right', selector: 'img', attributes: { class: 'image-right' }}
    ]

});
