//= require ./vendors/moment.min
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require ./vendors/angular
//= require ./vendors/bootstrap
//= require ./vendors/loading-bar
//= require ./vendors/notify
//= require ./vendors/select2
//= require ./vendors/fullcalendar
// require_tree ./customer

//$(document).on('ready page:load', function(){
//    $('#header_category_id, #header_subcategory_id').select2();
//});

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
}