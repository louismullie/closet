var container, buttoncontainer, button;

$(document).ready(function(){

// Auto-updater

var everyxseconds = 10; // Every 10 seconds

container = $("#container ul");
buttoncontainer = $('#newcontent');
button = buttoncontainer.find('a.btn'); // shortcut
button.data("unloaded", 0);

var autocheck = setInterval(function(){

  // Query for elements newer than the first li loaded
  var latest = container.find("li").first().attr("id");

  $.get("/get/" + latest, function(data){

    if(data.length > 0){ // There is new content
      console.log(data.length);
      console.log(data);
      // If there are already unloaded elements
      if($.hasData(button)){
        button.data("unloaded", $(this).data("unloaded") + data.length); // Append them to the unloaded counter
      } else {
        button.data("unloaded", data.length); // Make the unloaded counter
      }

      $.each(data, function(index,html) {
        container.prepend(html);
      })

      // Instead of this will come the function that will prepend the <li>
      // container.prepend(data);

      button.find("span").html("(" + data.length + ")"); // Update the unloaded counter
      buttoncontainer.show(); // Show the updater container

    }

  }).error(function(xhr, textStatus, errorThrown){

    // if(textStatus == "timeout") {
    //   this.tryCount++;
    //   if (this.tryCount <= 5) {
    //     $.ajax(this); // Try again
    //     return;
    //   }
    //   alert('We have tried ' + 5 + ' times and it is still not working. We give in. Sorry.');
    //   return;
    // }
    // if (xhr.status == 500) {
    //   alert('Oops! There seems to be a server problem, please try again later.');
    // } else {
    //   alert('Oops! There was a problem, sorry.');
    // }

  });

}, everyxseconds * 1000);

// Get new posts

$('#newcontent a.btn').click(function(e){

  e.preventDefault();

  container.find("li").show();
  
  // Bind toggling text on/off.
  container.find('.card')
  .unbind('click')  // Hack ... 2x toggle class = nothing.
  .click(function(e) {
    $(this).find('p').toggleClass('hidden');
  });
  
  button // Reset the unloaded counter
    .find("span").html("(0)")
    .data("unloaded", 0);

  buttoncontainer.hide(); // Hide the updater container

});

$('.card').click(function(e) {
  $(this).find('p').toggleClass('hidden');
});

}); // $(document).ready()