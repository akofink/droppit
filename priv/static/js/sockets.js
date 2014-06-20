$(function() {
  var socket = new Phoenix.Socket("ws://" + location.host + "/ws")
  var $messages = $("#messages");
  var $fileField = $("#file-field");
  var $fileForm = $("#file-form");

  socket.join("drop_spaces", "lobby", {username: $("#username").val()}, function(channel) {
    channel.on("user:entered", function(message) {
      $messages.append("<br/>[" + message.username + "] entered");
    });

    channel.on("file:dropped", function(args) {
      $messages.append("<br/><a href='" + args.result + "'>[" + args.file.name + "]</a> dropped by " + args.username);
    });

    $fileForm.off("submit").on("submit", function(event) {
      event.preventDefault();
      var fileReader = new FileReader();
      var file = $("#file-field")[0].files[0]

      fileReader.onload = (function(file) {
        return (function(e) {
          channel.send("file:dropped", {
            result: e.target.result,
            file: $("#file-field")[0].files[0],
            username: $("#username").val()
          });
        })(file);
      });
      fileReader.readAsDataURL(file);
    });
  });
});
