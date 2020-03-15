$(function(){
  $(".dropdwn").mouseenter(function(){
    $("li:not(:animated)", this).slideDown();
}),(function(){
  $("li.dropdwn_menu", this).slideUp();
});
});
