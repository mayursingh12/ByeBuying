/*
 *= require jquery
 *= require jquery_ujs
 *= require turbolinks
 *= require ./vendors/angular
 *= require ./vendors/bootstrap
 *= require ./vendors/loading-bar
 *= require ./vendors/notify
 *= require ./vendors/select2
 *= require_tree ./admin
 */


$(document).on('ready page:load', function(){
    $('#header_category_id, #header_subcategory_id').select2();
});