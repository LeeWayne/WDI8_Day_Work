// Add New Task to the list
// Create task in the DB
// Destroy task
// Change task status
// Get all the tasks

// Define functions

// Write code for document ready $(function(){})

function request(method, url, data) {
  return $.ajax({
    method: method,
    url: url,
    dataType: "json",
    data: data
  });
}

function crateTask(){
  request("POST", "/tasks", {
    task: {
      title: $("#new-todo").val()
    }
  }).success(function(data){
    appendNewTask(data)
  });
}

function appendNewTask(data) {
  $('<li class="'+ (data.done == true ? "completed" : "") +'">'+
    '<input class="toggle" type="checkbox" data-id="' + data.id + '" '+ (data.done == true ? 'checked="checked"' : "") +'>'+
    '<label>'+ data.title +'</label>'+
    '<button class="destroy" data-id="' + data.id + '"></button>'+
  '</li>').prependTo('#todo-list');
}

function getTasks(){
  request("GET", "/tasks", null).success(function(data){
    $.each(data, function(i, task) {
      appendNewTask(task);
    })
  })
}

function destroyTask(){
  $this = $(this);
  var taskId = $(this).data("id")
  request("DELETE", "/tasks/"+taskId, null).success(function(data){
    $this.parent().remove();
  });
}

function changeTaskStatus(){
  $this = $(this);
  var taskId = $(this).data("id")
  request("PUT", "/tasks/"+taskId, {task: {done: true}}).success(function(data){
    $this.parent().toggleClass("completed");
  });
}

$(function(){

  $(document).keypress(function(e) {
    if(e.which == 13) crateTask()
  });

  $('#todo-list').on('click', ".destroy", destroyTask)
  $('#todo-list').on('click', ".toggle", changeTaskStatus)
  getTasks();

});













