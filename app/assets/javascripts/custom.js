$( document ).ready(function() {
    console.log("Ready");
      $(".awaiting-ballot").on("click", function(e){
        e.preventDefault();
        var id = $(this).attr('id');
        console.log(id);
   });
});