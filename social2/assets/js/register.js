// JavaScript Document
$(document).ready(function() {
    //klikatessa rekisteröidy, piilota kirjautuminen ja näytä rekisteröinti lomake
    
    $("#signup").click(function(){
    $("#first").slideUp("slow", function(){
        $("#second").slideDown("slow");
    });                 
        });
        
    //klikatessa kirjaudu, piilota rekisteröityminen ja näytä kirjautumisen lomake
           $("#signin").click(function(){
    $("#second").slideUp("slow", function(){
        $("#first").slideDown("slow");
        });                
    });
});