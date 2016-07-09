/*
 *= require_tree .
 *= require_self
 *= require ./vendors/bootstrap
 *= require ./vendors/loading-bar
 *= require ./vendors/notify
 *= require ./vendors/select2
 *= require_tree ./admin
 */


$(document).on('ready page:load', function(){
    $('#advertisement_category_id, #advertisement_subcategory_id').select2();
});