//= require active_admin/base
//= require activeadmin_addons/all


var admin = {

    init: function(){
        admin.set_admin_editable_events();
    },

    set_admin_editable_events: function(){
        $(document).on("keypress",".admin-editable", function(e){
            if ( e.keyCode==27 )
                $( e.currentTarget ).hide();

            if ( e.keyCode==13 ){
                var path        = $( e.currentTarget ).attr("data-path");
                var attr        = $( e.currentTarget ).attr("data-attr");
                var resource_id = $( e.currentTarget ).attr("data-resource-id");
                var val         = $( e.currentTarget ).val();

                val = $.trim(val)
                if (val.length==0)
                    val = "&nbsp;";

                $("div#"+$( e.currentTarget ).attr("id")).html(val);
                $( e.currentTarget ).hide();

                var payload = {}
                resource_class = path.slice(0,-1) // e.g. path = meters, resource_class = meter
                payload[resource_class] = {};
                payload[resource_class][attr] = val;

                $.put("/admin/"+path+"/"+resource_id, payload).done(function(result){
                    console.log(result);
                });
            }
        });

        $(document).on("blur",".admin-editable", function(e){
            $( e.currentTarget ).hide();
        });
    },

    editable_text_column_do: function(el){
        var input = "input#"+$(el).attr("id")

        $(input).width( $(el).width()+4 ).height( $(el).height()+4 );
        $(input).css({top: ( $(el).offset().top-2 ), left: ( $(el).offset().left-2 ), position:'absolute'});

        val = $.trim( $(el).html() );
        if (val=="&nbsp;")
            val = "";

        $(input).val( val );
        $(input).show();
        $(input).focus();
    }
}

$( document ).ready(function() {
    admin.init();
});


$(document).on('ready page:load turbolinks:load', function() {
  $('a.lextest').click(function(e) {
    e.stopPropagation();  // prevent Rails UJS click event
    e.preventDefault();

    ActiveAdmin.modal_dialog("Send email to: ", {emails: 'text'}, function(inputs) {alert (inputs.emails)})
  })
})