$(function() {
  var socket = new Phoenix.Socket("ws://" + location.host + "/ws")
  var $messages = $("#messages");
  var $fileField = $("#file-field");
  var $fileForm = $("#file-form");

  socket.join("drop_spaces", "lobby", {}, function(channel) {
    channel.on("user:entered", function(message) {
      $messages.append("<br/>[" + message.username + "] entered");
    });

    channel.on("file:dropped", function(file) {
      $messages.append("<br/><a href='" + file.file.data + "'>[" + file.name + "]</a> dropped");
    });

    $fileForm.off("submit").on("submit", function(event) {
      event.preventDefault();
      var fileReader = new FileReader();

      fileReader.onload = (function(file) {
        return (function(e) {
          channel.send("file:dropped", {
            data: e.target.result
          });
        })(file);
      });
      var file = $("#file-field")[0].files[0]
      fileReader.readAsDataURL(file);
    });
  });
});
