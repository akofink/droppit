$(function() {
  var socket = new Phoenix.Socket("ws://" + location.host + "/ws")
  var $messages = $("#messages");
  var $fileField = $("#file-field");
  var $fileForm = $("#file-form");
  var $chatForm = $("#chat-form");

  socket.join("drop_spaces", "lobby", {username: $("#username").val()}, function(channel) {
    channel.on("user:entered", function(message) {
      $messages.prepend("<li>[" + message.username + "] entered</li>");
    });

    channel.on("file:dropped", function(args) {
      $messages.prepend("<li><a href='" + args.result + "'>[" + args.file.name + "]</a> dropped by " + args.username + "</li>");
    });

    channel.on("message:dropped", function(args) {
      $messages.prepend("<li>" + args.username + ": " + args.message + "</li>");
    });

    $chatForm.off("submit").on("submit", function(event) {
      event.preventDefault();
      channel.send("message:dropped", {
        username: $("#username").val(),
        message: $("#chat-field").val()
      });
      $("#chat-field").val("")
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
